import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import 'package:mobile_ai/core/api/api_client.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/sync/sync_queue_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_metadata_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_item_collection.dart';
import 'package:mobile_ai/core/database/models/inventory/stock_collection.dart';

class SyncService {
  final ApiClient _apiClient;
  final IsarDatabase _db;
  final ConnectivityService _connectivity;
  final FlutterSecureStorage _storage;
  final Logger _logger;

  static const String _deviceIdKey = 'device_id';
  String? _cachedDeviceId;

  SyncService({
    ApiClient? apiClient,
    IsarDatabase? db,
    ConnectivityService? connectivity,
    FlutterSecureStorage? storage,
    Logger? logger,
  })  : _apiClient = apiClient ?? ApiClient(),
        _db = db ?? IsarDatabase(),
        _connectivity = connectivity ?? ConnectivityService(),
        _storage = storage ?? const FlutterSecureStorage(),
        _logger = logger ?? Logger();

  /// Get or create unique device ID
  Future<String> getDeviceId() async {
    if (_cachedDeviceId != null) return _cachedDeviceId!;

    String? deviceId = await _storage.read(key: _deviceIdKey);
    if (deviceId == null) {
      deviceId = const Uuid().v4();
      await _storage.write(key: _deviceIdKey, value: deviceId);
    }
    _cachedDeviceId = deviceId;
    return deviceId;
  }

  /// Push pending changes to backend
  Future<void> pushChanges() async {
    if (!_connectivity.isOnline) {
      _logger.d('Skipping push: Offline');
      return;
    }

    try {
      final deviceId = await getDeviceId();
      final isar = _db.isar;

        // 1. Get pending items (pending or failed for retry)
      final itemsToPush = await isar.syncQueueCollections
          .filter()
          .statusEqualTo(SyncQueueStatus.pending)
          .or()
          .statusEqualTo(SyncQueueStatus.failed)
          .sortByPriorityDesc()
          .findAll();

      if (itemsToPush.isEmpty) return;

      _logger.i('Pushing ${itemsToPush.length} items...');

      // 2. Prepare payload
      final itemsPayload = itemsToPush.map((item) {
        return {
          'id': item.queueId,
          'entity_type': _mapOperationToEntityType(item.operationType),
          'entity_id': _extractEntityId(item.dataJson),
          'operation': _mapOperationToBackendOp(item.operationType),
          'data': jsonDecode(item.dataJson),
          'client_timestamp': item.createdAt.toIso8601String(),
          'priority': item.priority,
        };
      }).toList();

      try {
        final response = await _apiClient.post(
          '/sync/push/',
          data: {
            'device_id': deviceId,
            'items': itemsPayload,
          },
        );

        // 4. Update local status based on response
        if (response.statusCode == 200 || response.statusCode == 201) {
          // Response contains created_items and errors
          
          await isar.writeTxn(() async {
            for (final item in itemsToPush) {
               // Mark as completed for now
               // In production, check if item.queueId is in created_items
               item.status = SyncQueueStatus.completed;
               item.lastAttemptAt = DateTime.now();
               await isar.syncQueueCollections.put(item);
            }
          });
          
          _logger.i('Push successful');
        }
      } catch (e) {
        // Handle API error
        await isar.writeTxn(() async {
          for (final item in itemsToPush) {
             item.retryCount += 1;
             item.lastAttemptAt = DateTime.now();
             item.lastError = e.toString();
             if (item.retryCount > 5) {
               item.status = SyncQueueStatus.failed;
             }
             await isar.syncQueueCollections.put(item);
          }
        });
        rethrow;
      }
      
    } catch (e) {
      _logger.e('Push failed', error: e);
    }
  }

  /// Pull changes from backend
  Future<void> pullChanges() async {
    if (!_connectivity.isOnline) return;

    try {
      final deviceId = await getDeviceId();
      final isar = _db.isar;

      // 1. Get global last sync timestamp
      // Use 'GLOBAL' as entityType for the watermark
      final metadata = await isar.syncMetadataCollections
          .filter()
          .entityTypeEqualTo('GLOBAL')
          .findFirst() ?? SyncMetadataCollection.create(entityType: 'GLOBAL');
      
      final lastSync = metadata.lastPullAt ?? DateTime(2000);

      // 2. Request changes
      final response = await _apiClient.get(
        '/sync/pull/',
        queryParameters: {
          'device_id': deviceId,
          'last_sync_timestamp': lastSync.toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final entities = data['entities'] as Map<String, dynamic>;
        final syncTimestamp = DateTime.parse(data['sync_timestamp']);

        await isar.writeTxn(() async {
          await _processPullEntities(entities, isar);
          
          // Update global watermark
          metadata.lastPullAt = syncTimestamp;
          metadata.lastPullCount = (data['changes_count'] as int?) ?? 0;
          await isar.syncMetadataCollections.put(metadata);
        });
        
        _logger.i('Pull successful. New watermark: $syncTimestamp');
      }
    } catch (e) {
      _logger.e('Pull failed', error: e);
    }
  }

  Future<void> _processPullEntities(Map<String, dynamic> entities, Isar isar) async {
    // Process BonPickings
    if (entities.containsKey('bon_pickings')) {
      final list = entities['bon_pickings'] as List;
      for (var json in list) {
        await _syncBonPicking(json, isar);
      }
    }
    
    // Process Stocks
    if (entities.containsKey('stocks')) {
      final list = entities['stocks'] as List;
      for (var json in list) {
        await _syncStock(json, isar);
      }
    }
    
    // Add logic for SKUs, Locations, etc. here
  }

  Future<void> _syncBonPicking(Map<String, dynamic> json, Isar isar) async {
    final backendId = json['id'] as String;
    
    // Check if exists
    final existing = await isar.bonPickingCollections
        .filter()
        .backendIdEqualTo(backendId)
        .findFirst();

    final bon = existing ?? BonPickingCollection.create(
      backendId: backendId,
      warehouseId: json['warehouse_id'],
      dailyOperationId: json['daily_operation_id'],
      employeeId: 'UNKNOWN', // Should come from auth or JSON if available
      createdAt: DateTime.now(), // Fallback
    );

    // Update fields
    bon.status = _parseStatus(json['status']);
    bon.totalDistance = (json['total_distance'] as num?)?.toDouble();
    bon.notes = json['notes'];
    bon.syncStatus = true;
    bon.remoteUpdateAt = DateTime.now();
    
    await isar.bonPickingCollections.put(bon); // Saves and sets ID

    // Sync Items
    if (json.containsKey('items')) {
      final itemsList = json['items'] as List;
      for (var itemJson in itemsList) {
        final itemBackendId = itemJson['id'] as String;
        
        final existingItem = await isar.bonPickingItemCollections
            .filter()
            .backendIdEqualTo(itemBackendId)
            .findFirst();

        final item = existingItem ?? BonPickingItemCollection.create(
          backendId: itemBackendId,
          bonPickingId: bon.id.toString(), // Link to parent
          skuId: itemJson['sku_id'],
          locationId: itemJson['location_id'] ?? 'UNKNOWN',
          quantity: itemJson['quantity'] ?? 0,
          createdAt: DateTime.now(),
        );

        item.picked = itemJson['picked'] ?? false;
        item.pickedAt = itemJson['picked_at'] != null 
            ? DateTime.parse(itemJson['picked_at']) 
            : null;
        item.syncStatus = true;
        
        await isar.bonPickingItemCollections.put(item);
      }
    }
  }

  Future<void> _syncStock(Map<String, dynamic> json, Isar isar) async {
    final skuId = json['sku_id'] as String;
    final locationId = json['location_id'] as String;
    final quantity = (json['quantity'] as num).toInt();

    // Composite key lookup
    final existing = await isar.stockCollections
        .filter()
        .skuIdEqualTo(skuId)
        .and()
        .locationIdEqualTo(locationId)
        .findFirst();

    if (existing != null) {
      existing.quantity = quantity;
      existing.remoteUpdateAt = DateTime.now();
      existing.syncStatus = true;
      await isar.stockCollections.put(existing);
    } else {
      final newStock = StockCollection.create(
        skuId: skuId,
        locationId: locationId,
        quantity: quantity,
        createdAt: DateTime.now(),
        syncStatus: true,
        remoteUpdateAt: DateTime.now(),
      );
      await isar.stockCollections.put(newStock);
    }
  }
  
  BonPickingStatus _parseStatus(String? status) {
     switch (status?.toUpperCase()) {
       case 'COMPLETED': return BonPickingStatus.completed;
       case 'IN_PROGRESS': return BonPickingStatus.inProgress;
       case 'CANCELLED': return BonPickingStatus.cancelled;
       default: return BonPickingStatus.pending;
     }
  }

  String _mapOperationToEntityType(SyncOperationType type) {
    final s = type.toString();
    if (s.contains('BonPicking')) return 'BonPicking';
    if (s.contains('BonCommande')) return 'BonCommande';
    if (s.contains('Stock')) return 'Stock';
    return 'Unknown';
  }

  String _mapOperationToBackendOp(SyncOperationType type) {
    // Basic mapping, assuming all pushes are updates/creates handled by backend processors
    // Ideally store operation in SyncQueue more explicitly
    return 'UPDATE'; 
  }

  String? _extractEntityId(String jsonStr) {
    try {
      final map = jsonDecode(jsonStr);
      return map['id'] ?? map['backendId'];
    } catch (_) {
      return null;
    }
  }
}
