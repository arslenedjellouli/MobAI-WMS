import 'dart:convert';
import 'package:dio/dio.dart';
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
import 'package:mobile_ai/core/database/models/operations/chariot_assignment_collection.dart';
import 'package:mobile_ai/core/database/models/operations/chariot_collection.dart';
import 'package:mobile_ai/core/database/models/operations/employee_task_collection.dart';
import 'package:mobile_ai/core/database/models/operations/task_report_collection.dart';

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
      Response response;
      try {
        response = await _apiClient.get(
          '/sync/pull/',
          queryParameters: {
            'device_id': deviceId,
            'last_sync_timestamp': timestampStr,
          },
        );
      } on DioException catch (e) {
        final isBadRequest = e.response?.statusCode == 400;
        if (!isBadRequest) rethrow;

        _logger.w(
          'Pull returned 400 with last_sync_timestamp. Retrying once without timestamp. '
          'Response: ${e.response?.data}',
        );

        response = await _apiClient.get(
          '/sync/pull/',
          queryParameters: {
            'device_id': deviceId,
          },
        );
      }

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
      if (e is DioException) {
        _logger.e('Backend error response body: ${e.response?.data}');
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

    // Process Chariot Assignments
    if (entities.containsKey('chariot_assignments')) {
      final list = entities['chariot_assignments'] as List;
      _logger.i('📥 Processing ${list.length} chariot assignments from sync');
      for (var json in list) {
        await _syncChariotAssignment(json, isar);
      }
      _logger.i('✅ Finished processing ${list.length} chariot assignments');
    }

    // Process Task Reports
    if (entities.containsKey('task_reports')) {
      final list = entities['task_reports'] as List;
      _logger.i('📥 Processing ${list.length} task reports from sync');
      for (var json in list) {
        await _syncTaskReport(json, isar);
      }
      _logger.i('✅ Finished processing ${list.length} task reports');
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
      warehouseId: json['warehouse_id'] ?? '',
      dailyOperationId: json['daily_operation_id'] as String?,
      bonPreparationId: json['bon_preparation_id'] as String?,
      employeeId: json['employee_id'] as String? ?? 'UNKNOWN',
      createdAt: DateTime.now(),
    );

    // Update fields
    bon.status = _parseStatus(json['status']);
    bon.totalDistance = (json['total_distance'] as num?)?.toDouble();
    bon.notes = json['notes'];
    if (json['completed_at'] != null) {
      bon.completedAt = DateTime.tryParse(json['completed_at'] as String);
    }
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
    if (json['ai_transfer_decision'] is Map<String, dynamic>) {
      task.notes = _upsertAiTransferDecisionNote(
        task.notes,
        json['ai_transfer_decision'] as Map<String, dynamic>,
      );
    }
    if (json['ai_transfer_override'] is Map<String, dynamic>) {
      task.notes = _upsertAiTransferOverrideNote(
        task.notes,
        json['ai_transfer_override'] as Map<String, dynamic>,
      );
    }
    task.bonReferenceType = json['bon_reference_type'];
    task.bonReferenceId = json['bon_reference_id'];
    task.updatedAt = _parseDateTime(json['updated_at']) ?? DateTime.now();
    task.syncStatus = true;
    task.remoteUpdateAt = DateTime.now();
    
    await isar.employeeTaskCollections.put(task);
    _logger.i('✅ Saved task: ${task.title} (assigned to: ${task.assignedToUserId})');
  }

  Future<void> _syncChariotAssignment(Map<String, dynamic> json, Isar isar) async {
    final backendId = json['id']?.toString();
    if (backendId == null || backendId.isEmpty) return;

    final existing = await isar.chariotAssignmentCollections
        .filter()
        .backendIdEqualTo(backendId)
        .findFirst();

    final assignment = existing ?? ChariotAssignmentCollection();
    assignment.backendId = backendId;

    final backendChariotId = json['chariot_id']?.toString();
    String resolvedChariotId = backendChariotId ?? assignment.chariotId;
    if (backendChariotId != null && backendChariotId.isNotEmpty) {
      final localChariot = await isar.chariotCollections
          .filter()
          .backendIdEqualTo(backendChariotId)
          .findFirst();
      if (localChariot != null) {
        resolvedChariotId = localChariot.backendId ?? localChariot.id.toString();
      }
    }
    assignment.chariotId = resolvedChariotId;
    final assignedToId = json['assigned_to_id']?.toString();
    final existingAssignedTo = existing?.assignedToUserId;
    assignment.assignedToUserId =
      (assignedToId != null && assignedToId.isNotEmpty)
      ? assignedToId
      : ((existingAssignedTo != null && existingAssignedTo.isNotEmpty)
          ? existingAssignedTo
          : 'UNKNOWN');
    assignment.operationType = _parseChariotOperationType(json['operation_type']);
    assignment.referenceDocumentId = json['reference_id']?.toString();
    assignment.assignedAt =
      _parseDateTime(json['assigned_at']) ??
      _parseDateTime(json['created_at']) ??
      existing?.assignedAt ??
      DateTime.now();
    assignment.releasedAt = _parseDateTime(json['released_at']);
    assignment.notes = json['notes']?.toString();
    assignment.syncStatus = true;
    assignment.remoteUpdateAt = DateTime.now();

    await isar.chariotAssignmentCollections.put(assignment);
  }

  ChariotOperationType _parseChariotOperationType(dynamic value) {
    final raw = value?.toString().toUpperCase().trim();
    switch (raw) {
      case 'PICKING':
        return ChariotOperationType.picking;
      case 'DELIVERY':
        return ChariotOperationType.delivery;
      case 'RECEIPT':
        return ChariotOperationType.receipt;
      case 'REPLENISHMENT':
      default:
        return ChariotOperationType.replenishment;
    }
  }

    Future<void> _syncTaskReport(Map<String, dynamic> json, Isar isar) async {
    final backendId = json['id']?.toString();
    if (backendId == null || backendId.isEmpty) return;

    final existing = await isar.taskReportCollections
      .filter()
      .backendIdEqualTo(backendId)
      .findFirst();

    final report = existing ?? TaskReportCollection();
    report.backendId = backendId;
    report.taskId = (json['task'] is Map)
      ? json['task']['id']?.toString()
      : json['task_id']?.toString();
    report.taskTitle = (json['task'] is Map) ? json['task']['title']?.toString() : null;
    report.reportedById = (json['reported_by'] is Map)
      ? json['reported_by']['id']?.toString()
      : json['reported_by_id']?.toString();
    report.reportedByName = (json['reported_by'] is Map)
      ? json['reported_by']['full_name']?.toString()
      : json['reported_by_name']?.toString();
    report.reportedByEmail = (json['reported_by'] is Map)
      ? json['reported_by']['email']?.toString()
      : json['reported_by_email']?.toString();
    report.supervisorId = (json['supervisor'] is Map)
      ? json['supervisor']['id']?.toString()
      : json['supervisor_id']?.toString();
    report.supervisorName = (json['supervisor'] is Map)
      ? json['supervisor']['full_name']?.toString()
      : json['supervisor_name']?.toString();
    report.issues =
      (json['issues'] as List<dynamic>?)?.map((item) => item.toString()).toList() ?? [];
    report.description = json['description']?.toString();
    report.status = _parseTaskReportStatus(json['status']?.toString());
    report.reportedAt = _parseDateTime(json['reported_at']?.toString()) ?? DateTime.now();
    report.acknowledgedAt = _parseDateTime(json['acknowledged_at']?.toString());
    report.resolvedAt = _parseDateTime(json['resolved_at']?.toString());
    report.supervisorNotes = json['supervisor_notes']?.toString();
    report.createdAt = _parseDateTime(json['created_at']?.toString()) ?? report.reportedAt;
    report.updatedAt = _parseDateTime(json['updated_at']?.toString()) ?? DateTime.now();
    report.syncStatus = true;

    await isar.taskReportCollections.put(report);
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

  TaskReportStatus _parseTaskReportStatus(String? status) {
    switch (status?.toUpperCase()) {
      case 'ACKNOWLEDGED':
        return TaskReportStatus.acknowledged;
      case 'RESOLVED':
        return TaskReportStatus.resolved;
      default:
        return TaskReportStatus.pending;
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

  String _upsertAiTransferDecisionNote(
    String? existingNotes,
    Map<String, dynamic> decision,
  ) {
    final lines = (existingNotes ?? '')
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .where((line) => !line.startsWith('AI_TRANSFER_DECISION:'))
        .toList();

    lines.add('AI_TRANSFER_DECISION:${jsonEncode(decision)}');
    return lines.join('\n');
  }

  String _upsertAiTransferOverrideNote(
    String? existingNotes,
    Map<String, dynamic> override,
  ) {
    final lines = (existingNotes ?? '')
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .where((line) => !line.startsWith('AI_TRANSFER_OVERRIDE:'))
        .toList();

    lines.add('AI_TRANSFER_OVERRIDE:${jsonEncode(override)}');
    return lines.join('\n');
  }

  String _mapOperationToEntityType(SyncOperationType type) {
    final s = type.toString();
    if (s.contains('BonPicking')) return 'BonPicking';
    if (s.contains('BonCommande')) return 'BonCommande';
    if (s.contains('BonReplenishment')) return 'BonReplenishment';
    if (s.contains('BonLivraison')) return 'BonLivraison';
    if (s.contains('BonPreparation')) return 'BonPreparation';
    if (s.contains('ChariotAssignment')) return 'ChariotAssignment';
    if (s.contains('Stock')) return 'Stock';
    if (s.contains('TaskReport')) return 'TaskReport';
    return 'Unknown';
  }

  String _mapOperationToBackendOp(SyncOperationType type) {
    // TaskReport is always CREATE (new reports, not updates)
    final s = type.toString();
    if (s.contains('TaskReport')) return 'CREATE';
    if (s.contains('ChariotAssignment')) return 'CREATE';
    
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
