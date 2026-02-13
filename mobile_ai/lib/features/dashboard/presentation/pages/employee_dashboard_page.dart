import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import 'package:mobile_ai/config/di/injection_container.dart';
import 'package:mobile_ai/core/api/api_client.dart';
import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_commande_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_livraison_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_replenishment_collection.dart';
import 'package:mobile_ai/core/database/models/operations/employee_task_collection.dart';
import 'package:mobile_ai/core/database/models/operations/task_report_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_metadata_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_queue_collection.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'dart:developer' as developer;

class EmployeeDashboardPage extends StatefulWidget {
  const EmployeeDashboardPage({super.key});

  @override
  State<EmployeeDashboardPage> createState() => _EmployeeDashboardPageState();
}

class _EmployeeDashboardPageState extends State<EmployeeDashboardPage> {
  final Isar _isar = sl<IsarDatabase>().isar;
  final SyncService _syncService = sl<SyncService>();
  final ConnectivityService _connectivityService = sl<ConnectivityService>();
  final ApiClient _apiClient = sl<ApiClient>();
  final Uuid _uuid = const Uuid();

  int _activeTabIndex = 0;
  bool _isLoading = true;
  bool _isSyncing = false;

  String _employeeName = 'Employee';
  String _employeeId = '-';
  String? _currentUserBackendId;
  bool _isOnline = false;
  String _lastSync = 'Never';

  final List<_TaskCardData> _currentTasks = [];
  final List<_TaskCardData> _remainingTasks = [];
  final List<_TaskCardData> _completedTasks = [];

  StreamSubscription<NetworkStatus>? _networkSub;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  @override
  void dispose() {
    _networkSub?.cancel();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    _isOnline = _connectivityService.isOnline;

    _networkSub = _connectivityService.networkStatusStream.listen((status) {
      if (!mounted) return;
      setState(() {
        _isOnline = status == NetworkStatus.online;
      });
    });

    await _loadDashboardData();

    if (_isOnline) {
      await _triggerSync(showLoader: false);
    }
  }

  Future<void> _loadDashboardData() async {
    final user = await _isar.userCollections.where().findFirst();
    final currentUserBackendId = user?.backendId;

    developer.log('👤 Current user: ${user?.fullName} (${user?.email})', name: 'EmployeeDashboard');
    developer.log('🆔 User backend ID: $currentUserBackendId', name: 'EmployeeDashboard');

    final syncMeta = await _isar.syncMetadataCollections
        .filter()
        .entityTypeEqualTo('GLOBAL')
        .findFirst();

    final commandes = await _isar.bonCommandeCollections.where().findAll();
    final replenish = await _isar.bonReplenishmentCollections.where().findAll();
    final picking = await _isar.bonPickingCollections.where().findAll();
    final livraison = await _isar.bonLivraisonCollections.where().findAll();
    
    // Load employee tasks - filter by user if we have backendId
    final List<EmployeeTaskCollection> employeeTasks;
    if (currentUserBackendId != null && currentUserBackendId.isNotEmpty) {
      employeeTasks = await _isar.employeeTaskCollections
          .filter()
          .assignedToUserIdEqualTo(currentUserBackendId)
          .findAll();
      developer.log('📋 Loaded ${employeeTasks.length} employee tasks for user $currentUserBackendId', name: 'EmployeeDashboard');
    } else {
      employeeTasks = await _isar.employeeTaskCollections.where().findAll();
      developer.log('📋 Loaded ${employeeTasks.length} total employee tasks (no user filter)', name: 'EmployeeDashboard');
    }

    final current = <_TaskCardData>[];
    final remaining = <_TaskCardData>[];
    final completed = <_TaskCardData>[];
    
    // Load all task reports to check if tasks have been reported
    final allReports = await _isar.taskReportCollections.where().findAll();
    
    bool hasTaskReport(String? backendId) {
      if (backendId == null) return false;
      return allReports.any((report) => report.taskId == backendId);
    }

    bool belongsToCurrentUser(String? employeeId) {
      if (currentUserBackendId == null || currentUserBackendId.isEmpty) {
        return true;
      }
      return employeeId == currentUserBackendId;
    }

    for (final item in commandes) {
      if (!belongsToCurrentUser(item.employeeId)) continue;
      final task = _taskFromCommande(item, hasTaskReport(item.backendId));
      if (item.status == BonCommandeStatus.inProgress) {
        current.add(task);
      } else if (item.status == BonCommandeStatus.completed) {
        completed.add(task);
      } else {
        remaining.add(task);
      }
    }

    for (final item in replenish) {
      if (!belongsToCurrentUser(item.employeeId)) continue;
      final task = _taskFromReplenishment(item, hasTaskReport(item.backendId));
      if (item.status == BonReplenishmentStatus.inProgress) {
        current.add(task);
      } else if (item.status == BonReplenishmentStatus.completed) {
        completed.add(task);
      } else {
        remaining.add(task);
      }
    }

    for (final item in picking) {
      if (!belongsToCurrentUser(item.employeeId)) continue;
      final task = _taskFromPicking(item, hasTaskReport(item.backendId));
      if (item.status == BonPickingStatus.inProgress) {
        current.add(task);
      } else if (item.status == BonPickingStatus.completed) {
        completed.add(task);
      } else {
        remaining.add(task);
      }
    }

    for (final item in livraison) {
      if (!belongsToCurrentUser(item.employeeId)) continue;
      final task = _taskFromLivraison(item, hasTaskReport(item.backendId));
      if (item.status == BonLivraisonStatus.inProgress) {
        current.add(task);
      } else if (item.status == BonLivraisonStatus.done) {
        completed.add(task);
      } else {
        remaining.add(task);
      }
    }

    // Load EmployeeTask entities from sync
    developer.log('📋 Employee tasks loaded from Isar: ${employeeTasks.length}', name: 'EmployeeDashboard');
    for (final item in employeeTasks) {
      developer.log('  - Task: ${item.title} (assigned to: ${item.assignedToUserId}, status: ${item.status})', name: 'EmployeeDashboard');
      if (!belongsToCurrentUser(item.assignedToUserId)) {
        developer.log('    ⚠️ Skipping - not assigned to current user', name: 'EmployeeDashboard');
        continue;
      }
      final task = _taskFromEmployeeTask(item, hasTaskReport(item.backendId));
      if (item.status == EmployeeTaskStatus.inProgress) {
        current.add(task);
      } else if (item.status == EmployeeTaskStatus.completed) {
        completed.add(task);
      } else {
        remaining.add(task);
      }
    }

    current.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    remaining.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    completed.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    developer.log('📊 Dashboard summary: Current=${current.length}, Remaining=${remaining.length}, Completed=${completed.length}', name: 'EmployeeDashboard');

    if (!mounted) return;
    setState(() {
      _currentUserBackendId = currentUserBackendId;
      _employeeName = user?.fullName ?? 'Employee';
      _employeeId = user?.backendId ?? (user?.id.toString() ?? '-');
      _lastSync = _formatSyncDate(syncMeta?.lastPullAt ?? syncMeta?.lastPushAt);

      _currentTasks
        ..clear()
        ..addAll(current);

      _remainingTasks
        ..clear()
        ..addAll(remaining);

      _completedTasks
        ..clear()
        ..addAll(completed);

      _isLoading = false;
    });
  }

  Future<void> _triggerSync({bool showLoader = true}) async {
    if (_isSyncing || !_isOnline) return;

    if (mounted) {
      setState(() {
        _isSyncing = true;
        if (showLoader) {
          _isLoading = true;
        }
      });
    }

    try {
      await _syncService.pushChanges();
      await _syncService.pullChanges();
      await _loadDashboardData();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sync failed. Please retry.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSyncing = false;
          _isLoading = false;
        });
      }
    }
  }

  String _formatSyncDate(DateTime? value) {
    if (value == null) return 'Never';
    final now = DateTime.now();
    final delta = now.difference(value);
    if (delta.inMinutes < 1) return 'now';
    if (delta.inHours < 1) return '${delta.inMinutes}m ago';
    if (delta.inDays < 1) return '${delta.inHours}h ago';
    return '${delta.inDays}d ago';
  }

  String _taskCode({
    String? backendId,
    required int localId,
    required TaskType type,
  }) {
    final raw = backendId != null && backendId.isNotEmpty
        ? backendId.replaceAll('-', '').toUpperCase()
        : localId.toString().padLeft(4, '0');

    final prefix = switch (type) {
      TaskType.receipt => 'RC',
      TaskType.storage => 'ST',
      TaskType.picking => 'PK',
      TaskType.delivery => 'DL',
      TaskType.preparation => 'PR',
      TaskType.replenishment => 'RP',
    };

    return '$prefix${raw.length > 6 ? raw.substring(0, 6) : raw}';
  }

  _TaskCardData _taskFromCommande(BonCommandeCollection item, bool hasReport) {
    return _TaskCardData(
      source: _TaskSource.bonCommande,
      localId: item.id,
      backendId: item.backendId,
      createdAt: item.createdAt,
      type: TaskType.receipt,
      code: _taskCode(
        backendId: item.backendId,
        localId: item.id,
        type: TaskType.receipt,
      ),
      floor: 'Warehouse ${item.warehouseId}',
      zoneOrSlotLabel: 'Order',
      zoneOrSlotValue: item.backendId ?? 'Local-${item.id}',
      skuCount: item.totalQuantityExpected,
      hasReport: hasReport,
    );
  }

  _TaskCardData _taskFromReplenishment(BonReplenishmentCollection item, bool hasReport) {
    return _TaskCardData(
      source: _TaskSource.bonReplenishment,
      localId: item.id,
      backendId: item.backendId,
      createdAt: item.createdAt,
      type: TaskType.storage,
      code: _taskCode(
        backendId: item.backendId,
        localId: item.id,
        type: TaskType.storage,
      ),
      floor: 'Warehouse ${item.warehouseId}',
      zoneOrSlotLabel: 'Order',
      zoneOrSlotValue: item.backendId ?? 'Local-${item.id}',
      skuCount: 0,
      hasReport: hasReport,
    );
  }

  _TaskCardData _taskFromPicking(BonPickingCollection item, bool hasReport) {
    return _TaskCardData(
      source: _TaskSource.bonPicking,
      localId: item.id,
      backendId: item.backendId,
      createdAt: item.createdAt,
      type: TaskType.picking,
      code: _taskCode(
        backendId: item.backendId,
        localId: item.id,
        type: TaskType.picking,
      ),
      floor: 'Warehouse ${item.warehouseId}',
      zoneOrSlotLabel: 'Order',
      zoneOrSlotValue: item.backendId ?? 'Local-${item.id}',
      skuCount: 0,
      hasReport: hasReport,
    );
  }

  _TaskCardData _taskFromLivraison(BonLivraisonCollection item, bool hasReport) {
    return _TaskCardData(
      source: _TaskSource.bonLivraison,
      localId: item.id,
      backendId: item.backendId,
      createdAt: item.createdAt,
      type: TaskType.delivery,
      code: _taskCode(
        backendId: item.backendId,
        localId: item.id,
        type: TaskType.delivery,
      ),
      floor: 'Warehouse ${item.warehouseId}',
      zoneOrSlotLabel: 'Delivery',
      zoneOrSlotValue: item.deliveryId,
      skuCount: 0,
      hasReport: hasReport,
    );
  }

  _TaskCardData _taskFromEmployeeTask(EmployeeTaskCollection item, bool hasReport) {
    final taskType = _mapEmployeeTaskTypeToTaskType(item.taskType);
    return _TaskCardData(
      source: _TaskSource.employeeTask,
      localId: item.id,
      backendId: item.backendId,
      createdAt: item.createdAt,
      type: taskType,
      code: _taskCode(
        backendId: item.backendId,
        localId: item.id,
        type: taskType,
      ),
      floor: 'Warehouse ${item.warehouseId}',
      zoneOrSlotLabel: 'Task',
      zoneOrSlotValue: item.title,
      skuCount: item.itemsCount,
      hasReport: hasReport,
    );
  }

  TaskType _mapEmployeeTaskTypeToTaskType(EmployeeTaskType type) {
    switch (type) {
      case EmployeeTaskType.receipt:
        return TaskType.receipt;
      case EmployeeTaskType.picking:
        return TaskType.picking;
      case EmployeeTaskType.preparation:
        return TaskType.preparation;
      case EmployeeTaskType.replenishment:
        return TaskType.replenishment;
      case EmployeeTaskType.delivery:
        return TaskType.delivery;
      case EmployeeTaskType.storage:
        return TaskType.storage;
    }
  }

  SyncOperationType _operationForTask(TaskType type) {
    return switch (type) {
      TaskType.receipt => SyncOperationType.pushBonCommande,
      TaskType.storage => SyncOperationType.pushBonReplenishment,
      TaskType.picking => SyncOperationType.pushBonPicking,
      TaskType.delivery => SyncOperationType.pushBonLivraison,
      TaskType.preparation => SyncOperationType.pushBonPicking,
      TaskType.replenishment => SyncOperationType.pushBonReplenishment,
    };
  }

  Future<void> _enqueueTaskSync(
    _TaskCardData task, {
    required String action,
    Map<String, dynamic>? extra,
    int priority = 6,
  }) async {
    final payload = {
      'id': task.backendId ?? task.localId.toString(),
      'local_id': task.localId,
      'action': action,
      'updated_at': DateTime.now().toIso8601String(),
      ...?extra,
    };

    final queueItem = SyncQueueCollection.create(
      queueId: _uuid.v4(),
      operationType: _operationForTask(task.type),
      dataJson: jsonEncode(payload),
      createdAt: DateTime.now(),
      priority: priority,
    );

    await _isar.writeTxn(() async {
      await _isar.syncQueueCollections.put(queueItem);
    });
  }

  Future<void> _markTaskInProgress(_TaskCardData task) async {
    // Update local ISAR first
    await _isar.writeTxn(() async {
      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonCommandeStatus.inProgress;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.status = BonReplenishmentStatus.inProgress;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonPickingStatus.inProgress;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonLivraisonStatus.inProgress;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonLivraisonCollections.put(entity);
        case _TaskSource.employeeTask:
          final entity = await _isar.employeeTaskCollections.get(task.localId);
          if (entity == null) return;
          entity.status = EmployeeTaskStatus.inProgress;
          entity.startedAt = DateTime.now();
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.employeeTaskCollections.put(entity);
      }
    });

    // Call API to update status on backend
    try {
      if (task.backendId != null) {
        await _apiClient.patch(
          '/v1/operations/tasks/${task.backendId}/',
          data: {
            'status': 'IN_PROGRESS',
            'started_at': DateTime.now().toIso8601String(),
          },
        );
        developer.log('✓ Task ${task.backendId} status updated to IN_PROGRESS via API', name: 'TaskUpdate');
      }
    } catch (e) {
      developer.log('✗ API call failed, queuing for sync: $e', name: 'TaskUpdate');
      // Fallback to sync queue if API fails
      await _enqueueTaskSync(task, action: 'IN_PROGRESS', priority: 8);
    }
    
    // Reload dashboard to reflect changes
    await _loadDashboardData();
    if (mounted) setState(() {});
  }

  Future<void> _markTaskCompleted(_TaskCardData task) async {
    // Update local ISAR first
    await _isar.writeTxn(() async {
      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonCommandeStatus.completed;
          entity.updatedAt = DateTime.now();
          entity.completedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.status = BonReplenishmentStatus.completed;
          entity.updatedAt = DateTime.now();
          entity.completedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonPickingStatus.completed;
          entity.updatedAt = DateTime.now();
          entity.completedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonLivraisonStatus.done;
          entity.updatedAt = DateTime.now();
          entity.completedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonLivraisonCollections.put(entity);
        case _TaskSource.employeeTask:
          final entity = await _isar.employeeTaskCollections.get(task.localId);
          if (entity == null) return;
          entity.status = EmployeeTaskStatus.completed;
          entity.completedAt = DateTime.now();
          entity.itemsCompleted = entity.itemsCount;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.employeeTaskCollections.put(entity);
      }
    });

    // Call API to update status on backend
    try {
      if (task.backendId != null) {
        await _apiClient.patch(
          '/v1/operations/tasks/${task.backendId}/',
          data: {
            'status': 'COMPLETED',
            'completed_at': DateTime.now().toIso8601String(),
          },
        );
        developer.log('✓ Task ${task.backendId} status updated to COMPLETED via API', name: 'TaskUpdate');
      }
    } catch (e) {
      developer.log('✗ API call failed, queuing for sync: $e', name: 'TaskUpdate');
      // Fallback to sync queue if API fails
      await _enqueueTaskSync(task, action: 'COMPLETED', priority: 9);
    }
    
    // Reload dashboard to reflect changes
    await _loadDashboardData();
    if (mounted) setState(() {});
  }

  Future<bool> _submitTaskReport(_TaskCardData task, List<String> issues) async {
    try {
      // Get current user info
      final user = await _isar.userCollections.where().findFirst();
      final userName = user?.fullName ?? 'employee';
      
      final payload = {
        'task_id': task.backendId ?? task.localId.toString(),
        'issues': issues,
        'description': 'Issues reported by $userName: ${issues.join(", ")}',
      };

      // Call backend API to create report
      developer.log('Submitting report for task ${task.backendId}', name: 'TaskReport');
      final response = await _apiClient.post(
        '/v1/operations/task-reports/submit/',
        data: payload,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        developer.log('Report submitted successfully', name: 'TaskReport');
        
        // Store report in ISAR
        final reportData = response.data;
        final report = TaskReportCollection.fromJson(reportData);
        
        await _isar.writeTxn(() async {
          await _isar.taskReportCollections.put(report);
        });
        
        developer.log('Report stored in ISAR: ${report.backendId}', name: 'TaskReport');
        
        // Reload dashboard to show updated tasks
        await _loadDashboardData();
        if (mounted) setState(() {});
        
        return true;
      } else {
        developer.log('Report submission failed: ${response.statusCode}', name: 'TaskReport');
        return false;
      }
    } catch (e) {
      developer.log('Error submitting report: $e', name: 'TaskReport');
      // Fallback: Queue for sync if API call fails (offline mode)
      await _queueTaskReportForSync(task, issues);
      return true; // Still return true since it's queued
    }
  }

  Future<void> _queueTaskReportForSync(_TaskCardData task, List<String> issues) async {
    // Fallback method for offline mode
    final user = await _isar.userCollections.where().findFirst();
    
    final payload = {
      'task_id': task.backendId ?? task.localId.toString(),
      'issues': issues,
      'reported_by_id': user?.backendId ?? user?.id.toString(),
      'reported_by_name': user?.fullName ?? 'Unknown',
      'reported_by_email': user?.email,
      'reported_at': DateTime.now().toIso8601String(),
      'description': 'Issues reported by ${user?.fullName ?? 'employee'}',
    };

    final queueItem = SyncQueueCollection.create(
      queueId: _uuid.v4(),
      operationType: SyncOperationType.pushTaskReport,
      dataJson: jsonEncode(payload),
      createdAt: DateTime.now(),
      priority: 10,
    );

    await _isar.writeTxn(() async {
      await _isar.syncQueueCollections.put(queueItem);
    });
    developer.log('Report queued for sync (offline mode)', name: 'TaskReport');
  }

  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Logout',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: GoogleFonts.manrope(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancel',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(
              'Logout',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // Clear tokens from database
    final user = await _isar.userCollections.where().findFirst();
    if (user != null) {
      await _isar.writeTxn(() async {
        user.accessToken = null;
        user.refreshToken = null;
        user.tokenExpiresAt = null;
        await _isar.userCollections.put(user);
      });
    }

    // Navigate to login and clear stack
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final stats = _buildShiftStats();

    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF1F5F9),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _triggerSync(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(textTheme),
                const SizedBox(height: 20),
                Text(
                  "Today's Shift",
                  style: GoogleFonts.manrope(
                    textStyle: textTheme.titleMedium,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                _buildShiftTabs(textTheme, stats),
                const SizedBox(height: 20),
                if (_activeTabIndex == 0)
                  _buildCurrentTask(textTheme)
                else if (_activeTabIndex == 1)
                  _buildCompletedTasks(textTheme)
                else
                  _buildRemainingTasks(textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello $_employeeName,',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.titleLarge,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Employee #$_employeeId',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.bodyMedium,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: _isOnline && !_isSyncing ? _triggerSync : null,
                  icon: _isSyncing
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.sync, size: 20),
                  tooltip: 'Sync',
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: _handleLogout,
                  icon: const Icon(Icons.logout, size: 20, color: Colors.red),
                  tooltip: 'Logout',
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _isOnline
                        ? const Color(0xFF22C55E)
                        : const Color(0xFFEF4444),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  _isOnline ? 'Online' : 'Offline',
                  style: GoogleFonts.manrope(
                    textStyle: textTheme.bodyMedium,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Last sync: $_lastSync',
              style: GoogleFonts.manrope(
                textStyle: textTheme.bodySmall,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<_ShiftStat> _buildShiftStats() {
    return [
      _ShiftStat(label: 'Tasks', value: _currentTasks.length),
      _ShiftStat(label: 'Completed', value: _completedTasks.length),
      _ShiftStat(label: 'Remaining', value: _remainingTasks.length),
    ];
  }

  Widget _buildShiftTabs(TextTheme textTheme, List<_ShiftStat> stats) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(stats.length, (index) {
        final stat = stats[index];
        final isActive = _activeTabIndex == index;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index == stats.length - 1 ? 0 : 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => setState(() => _activeTabIndex = index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isActive
                        ? const Color(0xFF3C91CC)
                        : Colors.transparent,
                    width: 1.4,
                  ),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  children: [
                    Text(
                      '${stat.value}',
                      style: GoogleFonts.manrope(
                        textStyle: textTheme.titleLarge,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      stat.label,
                      style: GoogleFonts.manrope(
                        textStyle: textTheme.bodySmall,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCurrentTask(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Tasks',
          style: GoogleFonts.manrope(
            textStyle: textTheme.titleMedium,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        if (_currentTasks.isEmpty)
          _buildEmptyState(
            textTheme,
            'No tasks in progress. Start a task from Remaining.',
          )
        else
          ..._currentTasks.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _TaskCard(
                data: task,
                showDualActions: true,
                onValidate: () {
                  _completeTask(task);
                },
                onReport: () => _showReportSheet(task),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRemainingTasks(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Remaining Tasks',
          style: GoogleFonts.manrope(
            textStyle: textTheme.titleMedium,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        if (_remainingTasks.isEmpty)
          _buildEmptyState(textTheme, 'No remaining tasks.')
        else
          ..._remainingTasks.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _TaskCard(
                data: task,
                onStart: () {
                  _handleStartTask(task);
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCompletedTasks(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Completed Tasks',
            style: GoogleFonts.manrope(
              textStyle: textTheme.titleMedium,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          if (_completedTasks.isEmpty)
            _buildEmptyState(textTheme, 'No completed tasks yet.')
          else
            ..._completedTasks.map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _TaskCard(
                  data: task, 
                  showCompleted: true,
                  onReport: task.hasReport ? null : () => _showReportSheet(task),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(TextTheme textTheme, String message) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFF94A3B8)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.manrope(
                textStyle: textTheme.bodyMedium,
                color: const Color(0xFF64748B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleStartTask(_TaskCardData task) async {
    final shouldShowSheet = task.type != TaskType.receipt;

    await _markTaskInProgress(task);

    setState(() {
      _remainingTasks.remove(task);
      _currentTasks.add(task);
    });

    if (shouldShowSheet) {
      await _showTaskActionSheet(task);
    }

    await _triggerSync(showLoader: false);
  }

  Future<void> _completeTask(_TaskCardData task) async {
    await _markTaskCompleted(task);

    setState(() {
      _currentTasks.remove(task);
      _completedTasks.insert(0, task);
    });

    await _triggerSync(showLoader: false);
  }

  Future<void> _showTaskActionSheet(_TaskCardData task) async {
    final textTheme = Theme.of(context).textTheme;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.1,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _showReportSheet(task);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFDC2626),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.report_outlined, size: 18),
                            label: Text(
                              'Report',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyMedium,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _completeTask(task);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3C91CC),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(
                              Icons.check_circle_outline,
                              size: 18,
                            ),
                            label: Text(
                              'Validate',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyMedium,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showReportSheet(_TaskCardData task) async {
    final textTheme = Theme.of(context).textTheme;
    final options = _reportOptionsFor(task.type);
    final selected = <String>{};
    final sheetSize = _reportSheetSize(context, options.length);

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: sheetSize,
          minChildSize: sheetSize,
          maxChildSize: sheetSize,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Report Issue',
                    style: GoogleFonts.manrope(
                      textStyle: textTheme.titleLarge,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${task.type.label} Order - ${task.code}',
                    style: GoogleFonts.manrope(
                      textStyle: textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, setSheetState) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              for (final option in options)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      setSheetState(() {
                                        if (selected.contains(option)) {
                                          selected.remove(option);
                                        } else {
                                          selected.add(option);
                                        }
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 26,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            color: selected.contains(option)
                                                ? const Color(0xFFDC2626)
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFFCBD5E1),
                                              width: 2,
                                            ),
                                          ),
                                          child: selected.contains(option)
                                              ? const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 18,
                                                )
                                              : null,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            option,
                                            style: GoogleFonts.manrope(
                                              textStyle: textTheme.bodyLarge,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF334155),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (selected.isEmpty) {
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      title: Row(
                                        children: [
                                          const Icon(
                                            Icons.error_outline,
                                            color: Color(0xFFDC2626),
                                            size: 28,
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            'No Issue Selected',
                                            style: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xFF0F172A),
                                            ),
                                          ),
                                        ],
                                      ),
                                      content: Text(
                                        'Please select at least one issue before submitting the report.',
                                        style: GoogleFonts.manrope(
                                          color: const Color(0xFF64748B),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          style: TextButton.styleFrom(
                                            backgroundColor: const Color(0xFFDC2626),
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                              vertical: 12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            'OK',
                                            style: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }
                              
                              // Show loading
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                              
                              final success = await _submitTaskReport(
                                task,
                                selected.toList(),
                              );
                              
                              if (!mounted) return;
                              Navigator.of(context).pop(); // Close loading
                              Navigator.of(context).pop(); // Close dialog
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    success
                                        ? 'Report submitted successfully!'
                                        : 'Report queued for sync (offline mode)',
                                  ),
                                  backgroundColor: success
                                      ? const Color(0xFF10B981)
                                      : const Color(0xFFF59E0B),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFDC2626),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.report_outlined, size: 18),
                            label: Text(
                              'Send Report',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyMedium,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFFEE2E2),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyMedium,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFDC2626),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  double _reportSheetSize(BuildContext context, int optionCount) {
    final screenHeight = MediaQuery.of(context).size.height;
    const baseHeight = 300.0;
    const optionRowHeight = 44.0;
    final targetHeight = baseHeight + (optionRowHeight * optionCount);
    final fraction = targetHeight / screenHeight;
    return fraction.clamp(0.45, 0.9);
  }

  List<String> _reportOptionsFor(TaskType type) {
    switch (type) {
      case TaskType.receipt:
        return [
          'Damaged product',
          'Wrong product',
          'Extra items',
          'Missing items',
          'Pallet unstable / dangerous',
        ];
      case TaskType.delivery:
        return [
          'Truck not ready',
          'Missing items',
          'Damaged during transport',
          'Inside warehouse',
        ];
      case TaskType.picking:
        return [
          'Quantity insufficient',
          'Item damaged',
          'Cannot reach shelf',
          'Product not in slot',
        ];
      case TaskType.storage:
        return [
          'Slot physically inaccessible',
          'Quantity already stored',
          'Slot already occupied',
          'Chariot/cart problem',
          'Elevator not working',
          'Path blocked',
        ];
      case TaskType.preparation:
        return [
          'Missing items',
          'Damaged product',
          'Packaging material unavailable',
          'Wrong quantity',
          'Label printer issue',
        ];
      case TaskType.replenishment:
        return [
          'Stock not available',
          'Shelf full',
          'Wrong location',
          'Access blocked',
          'Item mismatch',
        ];
    }
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.data,
    this.showDualActions = false,
    this.showCompleted = false,
    this.onStart,
    this.onValidate,
    this.onReport,
  });

  final _TaskCardData data;
  final bool showDualActions;
  final bool showCompleted;
  final VoidCallback? onStart;
  final VoidCallback? onValidate;
  final VoidCallback? onReport;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final typeColor = data.type.color;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(data.type.icon, size: 16, color: typeColor),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${data.type.label} Order - ${data.code}',
                    style: GoogleFonts.manrope(
                      textStyle: textTheme.bodyLarge,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoRow(label: 'Floor', value: data.floor),
                      const SizedBox(height: 8),
                      _InfoRow(
                        label: data.zoneOrSlotLabel,
                        value: data.zoneOrSlotValue,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.inventory_2_outlined,
                            size: 18,
                            color: Color(0xFF475569),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${data.skuCount} SKUs',
                            style: GoogleFonts.manrope(
                              textStyle: textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF475569),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(data.type.icon, size: 40, color: typeColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: showDualActions
                ? Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onReport,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDC2626),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.report_outlined, size: 18),
                          label: Text(
                            'Report',
                            style: GoogleFonts.manrope(
                              textStyle: textTheme.bodyMedium,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onValidate,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3C91CC),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(
                            Icons.check_circle_outline,
                            size: 18,
                          ),
                          label: Text(
                            'Validate',
                            style: GoogleFonts.manrope(
                              textStyle: textTheme.bodyMedium,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: showCompleted ? null : onStart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: showCompleted
                            ? const Color(0xFFE2E8F0)
                            : typeColor,
                        foregroundColor: showCompleted
                            ? const Color(0xFF64748B)
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            showCompleted ? 'Completed' : 'Start',
                            style: GoogleFonts.manrope(
                              textStyle: textTheme.bodyLarge,
                              fontWeight: FontWeight.w700,
                              color: showCompleted
                                  ? const Color(0xFF64748B)
                                  : Colors.white,
                            ),
                          ),
                          if (!showCompleted) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward_rounded, size: 18),
                          ],
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RichText(
      text: TextSpan(
        style: GoogleFonts.manrope(
          textStyle: textTheme.bodyMedium,
          color: const Color(0xFF0F172A),
        ),
        children: [
          TextSpan(
            text: '$label : ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _ShiftStat {
  const _ShiftStat({required this.label, required this.value});

  final String label;
  final int value;
}

class _TaskCardData {
  const _TaskCardData({
    required this.source,
    required this.localId,
    required this.createdAt,
    required this.type,
    required this.code,
    required this.floor,
    required this.zoneOrSlotLabel,
    required this.zoneOrSlotValue,
    required this.skuCount,
    this.backendId,
    this.hasReport = false,
  });

  final _TaskSource source;
  final int localId;
  final String? backendId;
  final DateTime createdAt;

  final TaskType type;
  final String code;
  final String floor;
  final String zoneOrSlotLabel;
  final String zoneOrSlotValue;
  final int skuCount;
  final bool hasReport; // Whether task has a submitted report
}

enum _TaskSource { bonCommande, bonReplenishment, bonPicking, bonLivraison, employeeTask }

enum TaskType { receipt, storage, picking, delivery, preparation, replenishment }

extension TaskTypeUI on TaskType {
  String get label {
    switch (this) {
      case TaskType.receipt:
        return 'Receipt';
      case TaskType.storage:
        return 'Storage';
      case TaskType.picking:
        return 'Picking';
      case TaskType.delivery:
        return 'Delivery';
      case TaskType.preparation:
        return 'Preparation';
      case TaskType.replenishment:
        return 'Replenishment';
    }
  }

  Color get color {
    switch (this) {
      case TaskType.receipt:
        return const Color(0xFF3C91CC);
      case TaskType.storage:
        return const Color(0xFF7B67BF);
      case TaskType.picking:
        return const Color(0xFFFE8C21);
      case TaskType.delivery:
        return const Color(0xFF71B643);
      case TaskType.preparation:
        return const Color(0xFF8B5CF6);
      case TaskType.replenishment:
        return const Color(0xFF06B6D4);
    }
  }

  IconData get icon {
    switch (this) {
      case TaskType.receipt:
        return Icons.receipt_long;
      case TaskType.storage:
        return Icons.inventory_2;
      case TaskType.picking:
        return Icons.checklist;
      case TaskType.delivery:
        return Icons.local_shipping;
      case TaskType.preparation:
        return Icons.inventory;
      case TaskType.replenishment:
        return Icons.refresh;
    }
  }
}
