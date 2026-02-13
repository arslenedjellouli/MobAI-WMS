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
import 'package:mobile_ai/core/database/models/operations/employee_task_collection.dart';

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
          'client_timestamp': item.createdAt.toUtc().toIso8601String(),
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
          final data = response.data as Map<String, dynamic>? ?? const {};
          final errorCount = (data['error_count'] as int?) ?? 0;
          final errors = (data['errors'] as List?) ?? const [];

          await isar.writeTxn(() async {
            for (final item in itemsToPush) {
               if (errorCount > 0) {
                 item.status = SyncQueueStatus.failed;
                 item.lastError = errors.isNotEmpty
                     ? errors.first.toString()
                     : 'Backend rejected sync payload';
               } else {
                 item.status = SyncQueueStatus.completed;
                 item.lastError = null;
               }
               item.lastAttemptAt = DateTime.now();
               await isar.syncQueueCollections.put(item);
            }
          });
          
          if (errorCount > 0) {
            _logger.w('Push completed with backend errors: $errorCount');
          } else {
            _logger.i('Push successful');
          }
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
      
      // Ensure timestamp is in UTC with proper timezone indicator for Django
      final timestampStr = lastSync.toUtc().toIso8601String();
      // Dart's toIso8601String() on UTC datetime gives: 2000-01-01T00:00:00.000Z ✓
      
      _logger.d('Pull request: device_id=$deviceId, last_sync=$timestampStr');

      // 2. Request changes
      final response = await _apiClient.get(
        '/sync/pull/',
        queryParameters: {
          'device_id': deviceId,
          'last_sync_timestamp': timestampStr,
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
    } catch (e, stackTrace) {
      _logger.e('Pull failed', error: e, stackTrace: stackTrace);
      // Check if it's a Dio error with response data
      if (e.toString().contains('DioException') || e.toString().contains('DioError')) {
        _logger.e('Backend error response: ${e.toString()}');
      }
      rethrow;
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
    
    // Process Employee Tasks
    if (entities.containsKey('employee_tasks')) {
      final list = entities['employee_tasks'] as List;
      _logger.i('📥 Processing ${list.length} employee tasks from sync');
      for (var json in list) {
        await _syncEmployeeTask(json, isar);
      }
      _logger.i('✅ Finished processing ${list.length} employee tasks');
    } else {
      _logger.w('⚠️ No employee_tasks key in sync response entities');
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

  Future<void> _syncEmployeeTask(Map<String, dynamic> json, Isar isar) async {
    final backendId = json['id'] as String;
    final assignedToUserId = json['assigned_to_id'] ?? 'UNKNOWN';
    final title = json['title'] ?? 'Untitled Task';
    
    _logger.d('💾 Syncing employee task: $title');
    _logger.d('   Backend ID: $backendId');
    _logger.d('   Assigned To: $assignedToUserId');
    
    // Check if task already exists
    final existing = await isar.employeeTaskCollections
        .filter()
        .backendIdEqualTo(backendId)
        .findFirst();

    final task = existing ?? EmployeeTaskCollection.create(
      backendId: backendId,
      assignedToUserId: json['assigned_to_id'] ?? 'UNKNOWN',
      title: json['title'] ?? 'Untitled Task',
      taskType: _parseEmployeeTaskType(json['task_type']),
      warehouseId: json['warehouse_id'] ?? 'UNKNOWN',
      createdAt: _parseDateTime(json['created_at']) ?? DateTime.now(),
    );

    // Update all fields from backend
    task.assignedByUserId = json['assigned_by_id'];
    task.title = json['title'] ?? task.title;
    task.description = json['description'];
    task.taskType = _parseEmployeeTaskType(json['task_type']);
    task.status = _parseEmployeeTaskStatus(json['status']);
    task.warehouseId = json['warehouse_id'] ?? task.warehouseId;
    task.dailyOperationId = json['daily_operation_id'];
    task.priority = (json['priority'] as num?)?.toInt() ?? 0;
    task.dueDate = _parseDateTime(json['due_date']);
    task.startedAt = _parseDateTime(json['started_at']);
    task.completedAt = _parseDateTime(json['completed_at']);
    task.itemsCount = (json['items_count'] as num?)?.toInt() ?? 0;
    task.itemsCompleted = (json['items_completed'] as num?)?.toInt() ?? 0;
    task.estimatedDurationMinutes = (json['estimated_duration_minutes'] as num?)?.toInt();
    task.notes = json['notes'];
    task.bonReferenceType = json['bon_reference_type'];
    task.bonReferenceId = json['bon_reference_id'];
    task.updatedAt = _parseDateTime(json['updated_at']) ?? DateTime.now();
    task.syncStatus = true;
    task.remoteUpdateAt = DateTime.now();
    
    await isar.employeeTaskCollections.put(task);
    _logger.i('✅ Saved task: ${task.title} (assigned to: ${task.assignedToUserId})');
  }
  
  BonPickingStatus _parseStatus(String? status) {
     switch (status?.toUpperCase()) {
       case 'COMPLETED': return BonPickingStatus.completed;
       case 'IN_PROGRESS': return BonPickingStatus.inProgress;
       case 'CANCELLED': return BonPickingStatus.cancelled;
       default: return BonPickingStatus.pending;
     }
  }

  EmployeeTaskType _parseEmployeeTaskType(String? type) {
    switch (type?.toUpperCase()) {
      case 'RECEIPT': return EmployeeTaskType.receipt;
      case 'PICKING': return EmployeeTaskType.picking;
      case 'PREPARATION': return EmployeeTaskType.preparation;
      case 'REPLENISHMENT': return EmployeeTaskType.replenishment;
      case 'DELIVERY': return EmployeeTaskType.delivery;
      case 'STORAGE': return EmployeeTaskType.storage;
      default: return EmployeeTaskType.picking;
    }
  }

  EmployeeTaskStatus _parseEmployeeTaskStatus(String? status) {
    switch (status?.toUpperCase()) {
      case 'PENDING': return EmployeeTaskStatus.pending;
      case 'IN_PROGRESS': return EmployeeTaskStatus.inProgress;
      case 'COMPLETED': return EmployeeTaskStatus.completed;
      case 'CANCELLED': return EmployeeTaskStatus.cancelled;
      default: return EmployeeTaskStatus.pending;
    }
  }

  DateTime? _parseDateTime(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return null;
    try {
      return DateTime.parse(dateStr);
    } catch (_) {
      return null;
    }
  }

  String _mapOperationToEntityType(SyncOperationType type) {
    final s = type.toString();
    if (s.contains('BonPicking')) return 'BonPicking';
    if (s.contains('BonCommande')) return 'BonCommande';
    if (s.contains('BonReplenishment')) return 'BonReplenishment';
    if (s.contains('BonLivraison')) return 'BonLivraison';
    if (s.contains('BonPreparation')) return 'BonPreparation';
    if (s.contains('Stock')) return 'Stock';
    if (s.contains('TaskReport')) return 'TaskReport';
    return 'Unknown';
  }

  String _mapOperationToBackendOp(SyncOperationType type) {
    // TaskReport is always CREATE (new reports, not updates)
    final s = type.toString();
    if (s.contains('TaskReport')) return 'CREATE';
    
    // Basic mapping, assuming all other pushes are updates/creates handled by backend processors
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
