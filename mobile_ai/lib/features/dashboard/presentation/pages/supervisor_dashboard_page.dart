import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import 'package:mobile_ai/config/di/injection_container.dart';
import 'package:mobile_ai/core/api/api_client.dart';
import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_commande_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_commande_item_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_livraison_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_livraison_item_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_item_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_replenishment_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_replenishment_item_collection.dart';
import 'package:mobile_ai/core/database/models/inventory/sku_collection.dart';
import 'package:mobile_ai/core/database/models/operations/chariot_assignment_collection.dart';
import 'package:mobile_ai/core/database/models/operations/chariot_collection.dart';
import 'package:mobile_ai/core/database/models/operations/employee_task_collection.dart';
import 'package:mobile_ai/core/database/models/operations/task_report_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_metadata_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_queue_collection.dart';
import 'package:mobile_ai/core/database/models/warehouse/floor_collection.dart';
import 'package:mobile_ai/core/database/models/warehouse/location_collection.dart';
import 'package:mobile_ai/core/database/models/warehouse/section_collection.dart';
import 'package:mobile_ai/core/database/models/warehouse/slot_collection.dart';
import 'package:mobile_ai/core/database/models/warehouse/warehouse_collection.dart';
import 'package:mobile_ai/core/database/models/warehouse/zone_collection.dart';
import 'package:mobile_ai/core/network/network_service.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';
import 'package:mobile_ai/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_ai/features/chariots/data/datasources/chariot_remote_datasource.dart';
import 'package:mobile_ai/features/chariots/data/models/chariot_api_models.dart';
import 'package:mobile_ai/features/warehouse/data/datasources/floor_remote_datasource.dart';
import 'package:mobile_ai/features/warehouse/data/datasources/warehouse_remote_datasource.dart';
import 'package:mobile_ai/features/warehouse/data/models/warehouse_api_models.dart';
import 'package:mobile_ai/shared/widgets/app_bottom_bar.dart';

enum SupervisorHomeSection { all, reviewOnly }

class SupervisorDashboardPage extends StatefulWidget {
  const SupervisorDashboardPage({
    super.key,
    this.initialTab = AppBottomTab.home,
    this.showBottomBar = true,
    this.homeSection = SupervisorHomeSection.all,
  });

  final AppBottomTab initialTab;
  final bool showBottomBar;
  final SupervisorHomeSection homeSection;

  @override
  State<SupervisorDashboardPage> createState() =>
      _SupervisorDashboardPageState();
}

class _SupervisorDashboardPageState extends State<SupervisorDashboardPage> {
  final Isar _isar = sl<IsarDatabase>().isar;
  final ApiClient _apiClient = sl<ApiClient>();
  final SyncService _syncService = sl<SyncService>();
  final ConnectivityService _connectivityService = sl<ConnectivityService>();
  final FloorRemoteDatasource _floorRemoteDatasource =
      FloorRemoteDatasourceImpl(apiClient: sl<ApiClient>());
  final WarehouseRemoteDatasource _warehouseRemoteDatasource =
      WarehouseRemoteDatasourceImpl(apiClient: sl<ApiClient>());
  final ChariotRemoteDatasource _chariotRemoteDatasource =
      ChariotRemoteDatasourceImpl(apiClient: sl<ApiClient>());
  final Uuid _uuid = const Uuid();
  final PageController _reportedPageController = PageController(
    viewportFraction: 0.96,
  );
  final PageController _proposedPageController = PageController(
    viewportFraction: 0.96,
  );

  AppBottomTab _currentView = AppBottomTab.home;
  ProposedTaskFilter _selectedFilter = ProposedTaskFilter.forecast;
  ReportIssueFilter _selectedReportFilter = ReportIssueFilter.all;
  TaskTypeFilter _searchFilter = TaskTypeFilter.reports;
  bool _isLoading = true;
  bool _isSyncing = false;

  String _supervisorName = 'Supervisor';
  String _supervisorId = '-';
  String? _supervisorWarehouseId;
  bool _isOnline = false;
  String _lastSync = 'Never';
  final TextEditingController _searchController = TextEditingController();

  final List<_TaskCardData> _reportedTasks = [];
  final List<_TaskCardData> _proposedTasks = [];
  final List<_HistoryAction> _historyActions = [];

  int _receiptCount = 0;
  int _transferCount = 0;
  int _pickingCount = 0;
  int _currentReportedPage = 0;
  int _currentProposedPage = 0;

  MonitorOrderFilter _monitorOrderFilter = MonitorOrderFilter.all;
  String? _selectedMonitorChariotCode;
  int _selectedMonitorFloorIndex = 0;
  Future<_MonitorDataBundle>? _monitorFuture;
  final Set<String> _expandedMonitorOrderIds = <String>{};

  StreamSubscription<NetworkStatus>? _networkSub;

  @override
  void initState() {
    super.initState();
    _currentView = widget.initialTab;
    _bootstrap();
  }

  @override
  void dispose() {
    _networkSub?.cancel();
    _reportedPageController.dispose();
    _proposedPageController.dispose();
    _searchController.dispose();
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
    _monitorFuture = _loadMonitorData();

    if (_isOnline) {
      await _triggerSync(showLoader: false);
    }
  }

  Future<void> _loadDashboardData() async {
    final users = await _isar.userCollections.where().findAll();
    final user =
        users
            .where(
              (entry) =>
                  entry.accessToken != null && entry.accessToken!.isNotEmpty,
            )
            .cast<UserCollection?>()
            .firstWhere((value) => value != null, orElse: () => null) ??
        (users.isNotEmpty ? users.first : null);

    final syncMeta = await _isar.syncMetadataCollections
        .filter()
        .entityTypeEqualTo('GLOBAL')
        .findFirst();

    final commandes = await _isar.bonCommandeCollections.where().findAll();
    final replenish = await _isar.bonReplenishmentCollections.where().findAll();
    final picking = await _isar.bonPickingCollections.where().findAll();
    final livraison = await _isar.bonLivraisonCollections.where().findAll();
    final reports = await _isar.taskReportCollections.where().findAll();

    // Only load EmployeeTasks assigned BY this supervisor (not all tasks)
    final supervisorBackendId = user?.backendId;
    final allEmployeeTasks = await _isar.employeeTaskCollections
        .where()
        .findAll();
    final employeeTasks = allEmployeeTasks
        .where(
          (task) =>
              supervisorBackendId != null &&
              supervisorBackendId.isNotEmpty &&
              task.assignedByUserId == supervisorBackendId,
        )
        .toList();

    final reported = <_TaskCardData>[];
    final proposed = <_TaskCardData>[];
    final history = await _loadPersistedHistory();
    final taskByBackendId = <String, _TaskCardData>{};

    void registerTask(_TaskCardData task) {
      final backendId = task.backendId;
      if (backendId == null || backendId.isEmpty) return;
      taskByBackendId[backendId] = task;
    }

    // Process Employee Tasks
    for (final task in employeeTasks) {
      final taskCard = _taskFromEmployeeTask(task);
      registerTask(taskCard);

      if (task.status == EmployeeTaskStatus.pending) {
        proposed.add(taskCard);
      }
    }

    for (final item in commandes) {
      final task = _taskFromCommande(item);
      registerTask(task);
      if (item.status == BonCommandeStatus.pending) {
        proposed.add(task);
      }
    }

    for (final item in replenish) {
      final task = _taskFromReplenishment(item);
      registerTask(task);
      if (item.status == BonReplenishmentStatus.pending) {
        proposed.add(task);
      }
    }

    for (final item in picking) {
      final task = _taskFromPicking(item);
      registerTask(task);
      if (item.status == BonPickingStatus.pending) {
        proposed.add(task);
      }
    }

    for (final item in livraison) {
      final task = _taskFromLivraison(item);
      registerTask(task);
      if (item.status == BonLivraisonStatus.idle) {
        proposed.add(task);
      }
    }

    final reportTasks =
        reports
            .where(
              (report) =>
                  report.taskId != null &&
                  (report.status == TaskReportStatus.pending ||
                      report.status == TaskReportStatus.acknowledged),
            )
            .toList()
          ..sort((a, b) => b.reportedAt.compareTo(a.reportedAt));

    final reportedTaskIds = <String>{};
    for (final report in reportTasks) {
      final taskId = report.taskId;
      if (taskId == null || taskId.isEmpty) continue;
      final baseTask = taskByBackendId[taskId];
      if (baseTask == null) continue;
      reported.add(_taskFromReport(baseTask, report));
      reportedTaskIds.add(taskId);
    }

    proposed.removeWhere((task) {
      final backendId = task.backendId;
      if (backendId == null || backendId.isEmpty) return false;
      return reportedTaskIds.contains(backendId);
    });

    reported.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    proposed.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    // Donut totals should reflect active proposals only
    int receiptCount = 0;
    int transferCount = 0;
    int pickingCount = 0;
    for (final task in proposed) {
      switch (task.type) {
        case TaskType.receipt:
          receiptCount++;
          break;
        case TaskType.storage:
          transferCount++;
          break;
        case TaskType.picking:
          pickingCount++;
          break;
        case TaskType.delivery:
          transferCount++;
          break;
      }
    }

    if (!mounted) return;
    setState(() {
      _supervisorName = user?.fullName ?? 'Supervisor';
      _supervisorId = user?.backendId ?? (user?.id.toString() ?? '-');
      _supervisorWarehouseId = user?.warehouseId;
      _lastSync = _formatSyncDate(syncMeta?.lastPullAt ?? syncMeta?.lastPushAt);

      _reportedTasks
        ..clear()
        ..addAll(reported);

      _proposedTasks
        ..clear()
        ..addAll(proposed);

      _historyActions
        ..clear()
        ..addAll(history);

      _syncReportedPageToFiltered();
      _syncProposedPageToFiltered();

      _receiptCount = receiptCount;
      _transferCount = transferCount;
      _pickingCount = pickingCount;

      _isLoading = false;
      _monitorFuture = _loadMonitorData();
    });
  }

  Future<List<_HistoryAction>> _loadPersistedHistory() async {
    final queueItems = await _isar.syncQueueCollections
        .where()
        .sortByCreatedAtDesc()
        .findAll();

    final actions = <_HistoryAction>[];

    for (final item in queueItems) {
      try {
        final payload = jsonDecode(item.dataJson) as Map<String, dynamic>;
        final actionRaw = payload['action']?.toString().toUpperCase();
        if (actionRaw == null) continue;

        if (actionRaw != 'APPROVED' &&
            actionRaw != 'REJECTED' &&
            actionRaw != 'REASSIGNED' &&
            actionRaw != 'DELETED') {
          continue;
        }

        final taskCode = payload['task_code']?.toString();
        final taskType =
            _taskTypeFromString(payload['task_type']?.toString()) ??
            _taskTypeFromOperation(item.operationType);

        actions.add(
          _HistoryAction(
            action: _historyActionLabel(actionRaw),
            taskCode: taskCode ?? 'Unknown',
            type: taskType,
            timestamp: item.createdAt,
          ),
        );
      } catch (_) {
        // Ignore malformed queue entries
      }
    }

    return actions;
  }

  String _historyActionLabel(String actionRaw) {
    switch (actionRaw) {
      case 'APPROVED':
        return 'Approved';
      case 'REJECTED':
        return 'Rejected';
      case 'REASSIGNED':
        return 'Re-Assigned';
      case 'DELETED':
        return 'Deleted';
      default:
        return actionRaw;
    }
  }

  TaskType _taskTypeFromOperation(SyncOperationType operationType) {
    switch (operationType) {
      case SyncOperationType.pushBonCommande:
        return TaskType.receipt;
      case SyncOperationType.pushBonReplenishment:
        return TaskType.storage;
      case SyncOperationType.pushBonPicking:
        return TaskType.picking;
      case SyncOperationType.pushBonLivraison:
        return TaskType.delivery;
      default:
        return TaskType.receipt;
    }
  }

  TaskType? _taskTypeFromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'receipt':
        return TaskType.receipt;
      case 'storage':
        return TaskType.storage;
      case 'picking':
        return TaskType.picking;
      case 'delivery':
        return TaskType.delivery;
      default:
        return null;
    }
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
      TaskType.receipt => 'EY',
      TaskType.storage => 'ST',
      TaskType.picking => 'PK',
      TaskType.delivery => 'DL',
    };

    return '$prefix${raw.length > 6 ? raw.substring(0, 6) : raw}';
  }

  _TaskCardData _taskFromCommande(BonCommandeCollection item) {
    // Extract issue from notes if present
    final issues = <String>[];
    if (item.notes != null && item.notes!.contains('ISSUE_REPORTED:')) {
      final noteLines = item.notes!.split('\n');
      for (final line in noteLines) {
        if (line.contains('ISSUE_REPORTED:')) {
          issues.add(line.replaceFirst('ISSUE_REPORTED:', '').trim());
        }
      }
    }

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
      floor: 'Ground (0)',
      zoneOrSlotLabel: 'Zone',
      zoneOrSlotValue: 'Receiving Bay 1',
      skuCount: item.totalQuantityExpected,
      issues: issues,
    );
  }

  _TaskCardData _taskFromReplenishment(BonReplenishmentCollection item) {
    final issues = <String>[];
    if (item.notes != null && item.notes!.contains('ISSUE_REPORTED:')) {
      final noteLines = item.notes!.split('\n');
      for (final line in noteLines) {
        if (line.contains('ISSUE_REPORTED:')) {
          issues.add(line.replaceFirst('ISSUE_REPORTED:', '').trim());
        }
      }
    }

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
      floor: 'Floor 1',
      zoneOrSlotLabel: 'Slot',
      zoneOrSlotValue: 'A-12-03',
      skuCount: 0,
      issues: issues,
    );
  }

  _TaskCardData _taskFromPicking(BonPickingCollection item) {
    final issues = <String>[];
    if (item.notes != null && item.notes!.contains('ISSUE_REPORTED:')) {
      final noteLines = item.notes!.split('\n');
      for (final line in noteLines) {
        if (line.contains('ISSUE_REPORTED:')) {
          issues.add(line.replaceFirst('ISSUE_REPORTED:', '').trim());
        }
      }
    }

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
      floor: 'Floor 2',
      zoneOrSlotLabel: 'Zone',
      zoneOrSlotValue: 'Picking Area 3',
      skuCount: 0,
      issues: issues,
    );
  }

  _TaskCardData _taskFromLivraison(BonLivraisonCollection item) {
    final issues = <String>[];
    if (item.notes != null && item.notes!.contains('ISSUE_REPORTED:')) {
      final noteLines = item.notes!.split('\n');
      for (final line in noteLines) {
        if (line.contains('ISSUE_REPORTED:')) {
          issues.add(line.replaceFirst('ISSUE_REPORTED:', '').trim());
        }
      }
    }

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
      floor: 'Ground (0)',
      zoneOrSlotLabel: 'Bay',
      zoneOrSlotValue: 'Loading Dock 2',
      skuCount: 0,
      issues: issues,
    );
  }

  _TaskCardData _taskFromEmployeeTask(EmployeeTaskCollection task) {
    final issues = <String>[];
    if (task.notes != null && task.notes!.contains('ISSUE_REPORTED:')) {
      final noteLines = task.notes!.split('\n');
      for (final line in noteLines) {
        if (line.contains('ISSUE_REPORTED:')) {
          issues.add(line.replaceFirst('ISSUE_REPORTED:', '').trim());
        }
      }
    }

    final aiTransfer = _extractAiTransferDecisionFromNotes(task.notes);
    final aiFloor = aiTransfer?['floor'];
    final aiZone = aiTransfer?['zone']?.toString();
    final aiLocation = aiTransfer?['location_code']?.toString();
    final aiRoute = _routePreview(aiTransfer?['optimized_path']);
    if (aiRoute != null) {
      issues.add('Route: $aiRoute');
    }

    // Map EmployeeTaskType to TaskType
    TaskType taskType;
    switch (task.taskType) {
      case EmployeeTaskType.receipt:
        taskType = TaskType.receipt;
        break;
      case EmployeeTaskType.storage:
      case EmployeeTaskType.replenishment:
        taskType = TaskType.storage;
        break;
      case EmployeeTaskType.picking:
      case EmployeeTaskType.preparation:
        taskType = TaskType.picking;
        break;
      case EmployeeTaskType.delivery:
        taskType = TaskType.delivery;
        break;
    }

    return _TaskCardData(
      source: _TaskSource.employeeTask,
      localId: task.id,
      backendId: task.backendId,
      createdAt: task.createdAt,
      type: taskType,
      code: _taskCode(
        backendId: task.backendId,
        localId: task.id,
        type: taskType,
      ),
      floor: _aiFloorLabel(aiFloor),
      zoneOrSlotLabel: (aiZone != null || aiLocation != null)
          ? 'Zone / Place'
          : 'Task',
      zoneOrSlotValue: (aiZone != null || aiLocation != null)
          ? [
              if (aiZone != null && aiZone.isNotEmpty) aiZone,
              if (aiLocation != null && aiLocation.isNotEmpty) aiLocation,
            ].join(' • ')
          : (task.title ?? 'Untitled'),
      skuCount: task.itemsCount ?? 0,
      issues: issues,
    );
  }

  Map<String, dynamic>? _extractAiTransferDecisionFromNotes(String? notes) {
    if (notes == null || notes.isEmpty) return null;

    final trimmed = notes.trim();

    try {
      final decoded = jsonDecode(trimmed);
      if (decoded is Map<String, dynamic>) return decoded;
    } catch (_) {}

    final prefixes = [
      'AI_TRANSFER_DECISION:',
      'AI_DECISION:',
      'ROUTING_STRATEGY:',
    ];
    for (final prefix in prefixes) {
      final line = notes
          .split('\n')
          .map((value) => value.trim())
          .firstWhere((value) => value.startsWith(prefix), orElse: () => '');
      if (line.isEmpty) continue;

      final payload = line.replaceFirst(prefix, '').trim();
      if (payload.isEmpty) continue;

      try {
        final decoded = jsonDecode(payload);
        if (decoded is Map<String, dynamic>) return decoded;
      } catch (_) {}
    }

    return null;
  }

  String? _extractLocationOverrideFromNotes(String? notes) {
    if (notes == null || notes.isEmpty) return null;

    final lines = notes
        .split('\n')
        .map((value) => value.trim())
        .toList()
        .reversed;
    for (final line in lines) {
      if (!line.startsWith('LOCATION_OVERRIDE:')) continue;
      final payload = line.replaceFirst('LOCATION_OVERRIDE:', '').trim();
      if (payload.isNotEmpty) return payload;
    }

    return null;
  }

  List<String> _deriveMonitorRouteNodesFromNotes({
    required String? notes,
    required MonitorOrderStatus status,
  }) {
    final aiPayload = _extractAiTransferDecisionFromNotes(notes);
    final overrideLocationCode = _extractLocationOverrideFromNotes(notes);

    List<String> normalize(dynamic raw) {
      if (raw is! List) return const [];
      return raw
          .map((entry) => entry.toString().trim())
          .where((entry) => entry.isNotEmpty)
          .toList();
    }

    List<String> dedupeSequential(List<String> nodes) {
      final normalized = <String>[];
      for (final node in nodes) {
        if (normalized.isEmpty ||
            normalized.last.toUpperCase() != node.toUpperCase()) {
          normalized.add(node);
        }
      }
      return normalized;
    }

    if (status == MonitorOrderStatus.pending) {
      return const ['EXP_NODE'];
    }

    final optimized = normalize(aiPayload?['optimized_path']);
    final route = normalize(aiPayload?['route']);
    final returnPath = normalize(aiPayload?['return_path']);
    final aiLocationCode = aiPayload?['location_code']?.toString().trim();

    final forward = <String>[];

    final hasSupervisorOverride =
        overrideLocationCode != null && overrideLocationCode.isNotEmpty;

    if (hasSupervisorOverride) {
      forward.add('EXP_NODE');
      forward.add(overrideLocationCode);
    } else if (optimized.isNotEmpty) {
      forward.addAll(optimized);
    } else if (route.isNotEmpty) {
      forward.addAll(route);
    } else {
      forward.add('EXP_NODE');
      if (aiLocationCode != null && aiLocationCode.isNotEmpty) {
        forward.add(aiLocationCode);
      }
    }

    if (forward.isEmpty) {
      forward.add('EXP_NODE');
    }

    if (forward.first.toUpperCase() != 'EXP_NODE') {
      forward.insert(0, 'EXP_NODE');
    }

    final normalizedForward = dedupeSequential(forward);

    if (!hasSupervisorOverride &&
        status == MonitorOrderStatus.complete &&
        returnPath.isNotEmpty) {
      final merged = <String>[...normalizedForward];
      for (final node in returnPath) {
        if (merged.isEmpty || merged.last.toUpperCase() != node.toUpperCase()) {
          merged.add(node);
        }
      }
      return dedupeSequential(merged);
    }

    return normalizedForward;
  }

  List<String> _extractRouteNodesFromAIPayload(Map<String, dynamic>? payload) {
    if (payload == null) return const [];

    List<String> normalize(dynamic raw) {
      if (raw is! List) return const [];
      return raw
          .map((entry) => entry.toString().trim())
          .where((entry) => entry.isNotEmpty)
          .toList();
    }

    final optimized = normalize(payload['optimized_path']);
    if (optimized.isNotEmpty) return optimized;

    final route = normalize(payload['route']);
    if (route.isNotEmpty) return route;

    return normalize(payload['return_path']);
  }

  String _aiFloorLabel(dynamic floor) {
    if (floor == null) return 'Various';
    final level = int.tryParse(floor.toString());
    if (level == null) return floor.toString();
    if (level == 0) return 'Ground (0)';
    return 'Floor $level';
  }

  String? _routePreview(dynamic routeValue) {
    if (routeValue is! List) return null;
    final route = routeValue
        .map((node) => node.toString())
        .where((node) => node.isNotEmpty)
        .toList();
    if (route.isEmpty) return null;
    return route.join(' → ');
  }

  _TaskCardData _taskFromReport(
    _TaskCardData baseTask,
    TaskReportCollection report,
  ) {
    final reportIssues = report.issues.isNotEmpty
        ? report.issues
        : baseTask.issues;
    return _TaskCardData(
      source: baseTask.source,
      localId: baseTask.localId,
      backendId: baseTask.backendId,
      createdAt: report.reportedAt,
      type: baseTask.type,
      code: baseTask.code,
      floor: baseTask.floor,
      zoneOrSlotLabel: baseTask.zoneOrSlotLabel,
      zoneOrSlotValue: baseTask.zoneOrSlotValue,
      skuCount: baseTask.skuCount,
      issues: reportIssues,
      isEmployeeReport: true,
      reportLocalId: report.id,
      reportSuggestedSolution: _suggestedSolution(reportIssues, baseTask.type),
      reportDescription: report.description,
      reportedByName: report.reportedByName,
    );
  }

  String _suggestedSolution(List<String> issues, TaskType type) {
    final normalized = issues.map((e) => e.toLowerCase()).join(' | ');
    if (normalized.contains('missing') || normalized.contains('damaged')) {
      return 'Validate good quantity, store only valid items, and adjust received count.';
    }
    if (normalized.contains('slot') ||
        normalized.contains('location') ||
        normalized.contains('occupied') ||
        normalized.contains('blocked') ||
        normalized.contains('access')) {
      return 'Re-assign to a free location and continue execution.';
    }
    if (normalized.contains('wrong product') ||
        normalized.contains('mismatch')) {
      return 'Quarantine mismatch items and continue with verified products only.';
    }

    switch (type) {
      case TaskType.receipt:
        return 'Approve valid received quantity and continue receiving workflow.';
      case TaskType.storage:
        return 'Assign alternate slot and re-run storage execution.';
      case TaskType.picking:
        return 'Re-route picking with available stock/location.';
      case TaskType.delivery:
        return 'Escalate and continue with validated deliverable items only.';
    }
  }

  bool _requiresGoodQuantityAdjustment(_TaskCardData task) {
    if (task.type != TaskType.receipt) return false;
    return task.issues.any((issue) {
      final value = issue.toLowerCase();
      return value.contains('missing') || value.contains('damaged');
    });
  }

  SyncOperationType _operationForTask(TaskType type) {
    return switch (type) {
      TaskType.receipt => SyncOperationType.pushBonCommande,
      TaskType.storage => SyncOperationType.pushBonReplenishment,
      TaskType.picking => SyncOperationType.pushBonPicking,
      TaskType.delivery => SyncOperationType.pushBonLivraison,
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
      'task_code': task.code,
      'task_type': task.type.name,
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

  Future<void> _reassignTask(_TaskCardData task) async {
    String? syncStatus;
    String? syncNotes;

    await _isar.writeTxn(() async {
      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonCommandeStatus.pending;
          entity.notes = _clearIssueReportedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.status = BonReplenishmentStatus.pending;
          entity.notes = _clearIssueReportedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonPickingStatus.pending;
          entity.notes = _clearIssueReportedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonLivraisonStatus.idle;
          entity.notes = _clearIssueReportedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'IDLE';
          syncNotes = entity.notes;
          await _isar.bonLivraisonCollections.put(entity);
        case _TaskSource.employeeTask:
          final entity = await _isar.employeeTaskCollections.get(task.localId);
          if (entity == null) return;
          entity.status = EmployeeTaskStatus.pending;
          entity.notes = _clearIssueReportedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.employeeTaskCollections.put(entity);
      }
    });

    await _enqueueTaskSync(
      task,
      action: 'REASSIGNED',
      extra: {'status': syncStatus, 'notes': syncNotes},
      priority: 9,
    );

    setState(() {
      _reportedTasks.remove(task);
      _proposedTasks.insert(0, task);
      _syncReportedPageToFiltered();
    });

    _addHistoryAction('Re-Assigned', task.code, task.type);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task ${task.code} reassigned successfully')),
    );

    await _triggerSync(showLoader: false);
  }

  Future<void> _deleteTask(_TaskCardData task) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Delete Task',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
        content: Text(
          'Delete ${task.code} from Handle Reports?',
          style: GoogleFonts.manrope(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancel',
              style: GoogleFonts.manrope(
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(
              'Delete',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    String? syncStatus;
    String? syncNotes;

    await _isar.writeTxn(() async {
      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonCommandeStatus.completed;
          entity.notes = _markDeletedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'COMPLETED';
          syncNotes = entity.notes;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.status = BonReplenishmentStatus.cancelled;
          entity.notes = _markDeletedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'CANCELLED';
          syncNotes = entity.notes;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonPickingStatus.cancelled;
          entity.notes = _markDeletedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'CANCELLED';
          syncNotes = entity.notes;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonLivraisonStatus.failed;
          entity.notes = _markDeletedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'FAILED';
          syncNotes = entity.notes;
          await _isar.bonLivraisonCollections.put(entity);
        case _TaskSource.employeeTask:
          final entity = await _isar.employeeTaskCollections.get(task.localId);
          if (entity == null) return;
          entity.status = EmployeeTaskStatus.cancelled;
          entity.notes = _markDeletedNotes(entity.notes);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'CANCELLED';
          syncNotes = entity.notes;
          await _isar.employeeTaskCollections.put(entity);
      }
    });

    await _enqueueTaskSync(
      task,
      action: 'DELETED',
      extra: {'status': syncStatus, 'notes': syncNotes},
      priority: 9,
    );

    setState(() {
      _reportedTasks.remove(task);
      _syncReportedPageToFiltered();
    });

    _addHistoryAction('Deleted', task.code, task.type);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task ${task.code} deleted successfully')),
    );

    await _triggerSync(showLoader: false);
  }

  String _clearIssueReportedNotes(String? notes) {
    final lines = (notes ?? '')
        .split('\n')
        .where((line) => !line.contains('ISSUE_REPORTED'))
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    lines.add('REASSIGNED_BY_SUPERVISOR:${DateTime.now().toIso8601String()}');
    return lines.join('\n');
  }

  String _markDeletedNotes(String? notes) {
    final lines = (notes ?? '')
        .split('\n')
        .where((line) => !line.contains('ISSUE_REPORTED'))
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    lines.add('DELETED_BY_SUPERVISOR:${DateTime.now().toIso8601String()}');
    return lines.join('\n');
  }

  List<_TaskCardData> get _filteredProposedTasks {
    return _proposedTasks
        .where((task) => _selectedFilter.matches(task.type))
        .toList();
  }

  List<_TaskCardData> get _filteredReportedTasks {
    return _reportedTasks
        .where((task) => _selectedReportFilter.matches(task))
        .toList();
  }

  void _syncReportedPageToFiltered() {
    final filtered = _filteredReportedTasks;
    if (filtered.isEmpty) {
      _currentReportedPage = 0;
      return;
    }

    _currentReportedPage = math.min(_currentReportedPage, filtered.length - 1);
  }

  void _syncProposedPageToFiltered() {
    final filtered = _filteredProposedTasks;
    if (filtered.isEmpty) {
      _currentProposedPage = 0;
      return;
    }

    _currentProposedPage = math.min(_currentProposedPage, filtered.length - 1);
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

    await sl<AuthRepository>().logout();
    sl<NetworkService>().clearTokens();

    // Navigate to login and clear stack
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
    }
  }

  void _handleBottomTab(AppBottomTab tab) {
    setState(() {
      _currentView = tab;
    });
  }

  void _addHistoryAction(String action, String taskCode, TaskType type) {
    setState(() {
      _historyActions.insert(
        0,
        _HistoryAction(
          action: action,
          taskCode: taskCode,
          type: type,
          timestamp: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final totalTasks = _receiptCount + _transferCount + _pickingCount;

    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF1F5F9),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    Widget body;
    switch (_currentView) {
      case AppBottomTab.home:
        final isReviewOnly = widget.homeSection == SupervisorHomeSection.reviewOnly;
        body = RefreshIndicator(
          onRefresh: () => _triggerSync(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isReviewOnly) ...[
                  _buildHeader(textTheme),
                  const SizedBox(height: 24),
                  _buildDonutChart(totalTasks),
                  const SizedBox(height: 32),
                  _buildHandleReports(textTheme),
                  const SizedBox(height: 32),
                ],
                _buildReviewProposedTasks(textTheme),
              ],
            ),
          ),
        );
      case AppBottomTab.search:
        body = _buildSearchView(textTheme);
      case AppBottomTab.history:
        body = _buildHistoryView(textTheme);
      case AppBottomTab.monitor:
        body = _buildMonitorView(textTheme);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      bottomNavigationBar: widget.showBottomBar
          ? AppBottomBar(
              currentTab: _currentView,
              onTabSelected: _handleBottomTab,
            )
          : null,
      body: SafeArea(child: body),
    );
  }

  Widget _buildSearchView(TextTheme textTheme) {
    final allTasks = [..._reportedTasks, ..._proposedTasks];
    final filteredTasks = allTasks
        .where(
          (task) =>
              (_searchController.text.isEmpty ||
                  task.code.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  )) &&
              _searchFilter.matches(task),
        )
        .toList();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Orders Tracking',
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.manrope(
                    color: const Color(0xFF94A3B8),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF1F5F9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: TaskTypeFilter.values.map((filter) {
                    final isSelected = _searchFilter == filter;
                    final color = filter.color;

                    return InkWell(
                      onTap: () => setState(() => _searchFilter = filter),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? color : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? color : const Color(0xFFE2E8F0),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          filter.label,
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF64748B),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: filteredTasks.isEmpty
              ? Center(
                  child: Text(
                    'No tasks found',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredTasks.length,
                  itemBuilder: (context, index) {
                    final task = filteredTasks[index];
                    final isReported = task.isEmployeeReport;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Center(
                        child: SizedBox(
                          width: 356,
                          height: 252,
                          child: _SupervisorTaskCard(
                            data: task,
                            showReviewButton: true,
                            onReassign: null,
                            onReview: isReported
                                ? () => _reviewReport(task)
                                : () => _reviewTask(task),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildHistoryView(TextTheme textTheme) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            children: [
              const Icon(Icons.history, color: Color(0xFF3C91CC)),
              const SizedBox(width: 12),
              Text(
                'Action History',
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: _historyActions.isEmpty
              ? Center(
                  child: Text(
                    'No actions recorded yet',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _historyActions.length,
                  itemBuilder: (context, index) {
                    final action = _historyActions[index];
                    return _HistoryCard(action: action);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    final isOnlineNow = _isOnline;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello $_supervisorName,',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.headlineSmall,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Supervisor #$_supervisorId',
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
                  onPressed: isOnlineNow && !_isSyncing ? _triggerSync : null,
                  icon: _isSyncing
                      ? const SizedBox(
                          width: 20,
                          height: 20,
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
                    shape: BoxShape.circle,
                    color: isOnlineNow ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  isOnlineNow ? 'Online' : 'Offline',
                  style: GoogleFonts.manrope(
                    textStyle: textTheme.bodySmall,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDonutChart(int totalTasks) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 260,
            height: 150,
            child: CustomPaint(
              painter: _DonutChartPainter(
                receiptCount: _receiptCount,
                transferCount: _transferCount,
                pickingCount: _pickingCount,
                totalTasks: totalTasks,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$totalTasks',
                  style: GoogleFonts.manrope(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A),
                    height: 1.0,
                  ),
                ),
                Text(
                  'TASKS',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF64748B),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    '${_reportedTasks.length} Proposals | ${_proposedTasks.length} Reviews',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF64748B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHandleReports(TextTheme textTheme) {
    final selectedColor = _selectedReportFilter.color;
    final filteredReports = _filteredReportedTasks;
    final currentPage = filteredReports.isEmpty
        ? 0
        : math.min(_currentReportedPage, filteredReports.length - 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Handle Reports (${_reportedTasks.length})',
          style: GoogleFonts.manrope(
            textStyle: textTheme.titleLarge,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 16),
        _buildReportFilterButtons(),
        const SizedBox(height: 12),
        if (filteredReports.isEmpty)
          _buildEmptyState(textTheme, 'No reported issues.')
        else ...[
          SizedBox(
            height: 266,
            child: PageView.builder(
              controller: _reportedPageController,
              itemCount: filteredReports.length,
              onPageChanged: (index) {
                setState(() {
                  _currentReportedPage = index;
                });
              },
              itemBuilder: (context, index) {
                final task = filteredReports[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Center(
                    child: SizedBox(
                      width: 356,
                      height: 252,
                      child: _SupervisorTaskCard(
                        data: task,
                        compact: false,
                        overrideColor: selectedColor,
                        onReview: () => _reviewReport(task),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(filteredReports.length, (index) {
              final isActive = index == currentPage;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 10 : 8,
                height: isActive ? 10 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? selectedColor
                      : selectedColor.withOpacity(0.25),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }

  Widget _buildReviewProposedTasks(TextTheme textTheme) {
    final filteredTasks = _filteredProposedTasks;
    final selectedColor = _selectedFilter.color;
    final currentPage = filteredTasks.isEmpty
        ? 0
        : math.min(_currentProposedPage, filteredTasks.length - 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review AI Proposed Tasks',
          style: GoogleFonts.manrope(
            textStyle: textTheme.titleLarge,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 16),
        _buildFilterButtons(),
        const SizedBox(height: 10),
        Text(
          _selectedFilter.description,
          style: GoogleFonts.manrope(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 16),
        if (filteredTasks.isEmpty)
          _buildEmptyState(textTheme, 'No proposed tasks.')
        else ...[
          SizedBox(
            height: 252,
            child: PageView.builder(
              controller: _proposedPageController,
              itemCount: filteredTasks.length,
              onPageChanged: (index) {
                setState(() {
                  _currentProposedPage = index;
                });
              },
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Center(
                    child: SizedBox(
                      width: 356,
                      height: 252,
                      child: _SupervisorTaskCard(
                        data: task,
                        showReviewButton: true,
                        compact: false,
                        overrideColor: selectedColor,
                        onReview: () => _reviewTask(task),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(filteredTasks.length, (index) {
              final isActive = index == currentPage;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 10 : 8,
                height: isActive ? 10 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? selectedColor
                      : selectedColor.withOpacity(0.25),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }

  Widget _buildFilterButtons() {
    final chips = ProposedTaskFilter.values.map((filter) {
      final isSelected = _selectedFilter == filter;
      final color = filter.color;

      return InkWell(
        onTap: () {
          setState(() {
            _selectedFilter = filter;
            _currentProposedPage = 0;
            _syncProposedPageToFiltered();
          });
          if (_proposedPageController.hasClients) {
            _proposedPageController.jumpToPage(0);
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? color : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? color : const Color(0xFFE2E8F0),
              width: 2,
            ),
          ),
          child: Text(
            filter.label,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFF64748B),
            ),
          ),
        ),
      );
    }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < chips.length; i++) ...[
          chips[i],
          if (i != chips.length - 1) const SizedBox(width: 10),
        ],
      ],
    );
  }

  Widget _buildReportFilterButtons() {
    final chips = ReportIssueFilter.values.map((filter) {
      final isSelected = _selectedReportFilter == filter;

      return InkWell(
        onTap: () {
          setState(() {
            _selectedReportFilter = filter;
            _currentReportedPage = 0;
            _syncReportedPageToFiltered();
          });
          if (_reportedPageController.hasClients) {
            _reportedPageController.jumpToPage(0);
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: isSelected ? filter.color : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: filter.color.withOpacity(0.8)),
          ),
          child: Text(
            filter.label,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: isSelected ? Colors.white : filter.color,
            ),
          ),
        ),
      );
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: chips),
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

  Widget _buildMonitorView(TextTheme textTheme) {
    _monitorFuture ??= _loadMonitorData();

    return FutureBuilder<_MonitorDataBundle>(
      future: _monitorFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data;
        if (data == null) {
          return Center(
            child: Text(
              'Monitoring data unavailable',
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF64748B),
              ),
            ),
          );
        }

        final floors = data.floors;
        final floorIndex = floors.isEmpty
            ? 0
            : _selectedMonitorFloorIndex.clamp(0, floors.length - 1);
        final currentFloor = floors.isEmpty ? null : floors[floorIndex];

        final selectedCode = _selectedMonitorChariotCode ?? '__ALL__';
        final selectedChariot = _selectedMonitorChariotCode == null
            ? null
            : data.chariots
                  .where(
                    (chariot) => chariot.code == _selectedMonitorChariotCode,
                  )
                  .cast<_MonitorChariotData?>()
                  .firstWhere((value) => value != null, orElse: () => null);

        final filteredOrders = data.orders.where((order) {
          return switch (_monitorOrderFilter) {
            MonitorOrderFilter.all => true,
            MonitorOrderFilter.pending =>
              order.status == MonitorOrderStatus.pending,
            MonitorOrderFilter.inProgress =>
              order.status == MonitorOrderStatus.inProgress,
            MonitorOrderFilter.complete =>
              order.status == MonitorOrderStatus.complete,
            MonitorOrderFilter.reported =>
              order.status == MonitorOrderStatus.reported,
          };
        }).toList();

        final chariotsOnFloor = currentFloor == null
            ? <_MonitorChariotData>[]
            : data.chariots
                  .where((chariot) => chariot.floorLevel == currentFloor.level)
                  .toList();

        return RefreshIndicator(
          onRefresh: () async {
            await _loadDashboardData();
            if (!mounted) return;
            setState(() {
              _monitorFuture = _loadMonitorData();
            });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Monitoring',
                      style: GoogleFonts.manrope(
                        fontSize: 44 * 0.75,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCode,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF64748B),
                          ),
                          borderRadius: BorderRadius.circular(12),
                          items: [
                            DropdownMenuItem<String>(
                              value: '__ALL__',
                              child: Text(
                                'Select Chariot',
                                style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF334155),
                                ),
                              ),
                            ),
                            ...data.chariots.map(
                              (chariot) => DropdownMenuItem<String>(
                                value: chariot.code,
                                child: Text(
                                  'Vehicle: ${chariot.code}',
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF334155),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              _selectedMonitorChariotCode = value == '__ALL__'
                                  ? null
                                  : value;

                              if (_selectedMonitorChariotCode != null) {
                                final chosen = data.chariots.firstWhere(
                                  (chariot) =>
                                      chariot.code ==
                                      _selectedMonitorChariotCode,
                                  orElse: () => data.chariots.first,
                                );
                                final matchedFloor = floors.indexWhere(
                                  (floor) => floor.level == chosen.floorLevel,
                                );
                                if (matchedFloor >= 0) {
                                  _selectedMonitorFloorIndex = matchedFloor;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Warehouse Map • ${data.activeWarehouseLabel}',
                        style: GoogleFonts.manrope(
                          fontSize: 20 * 0.75,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF74839A),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: _showWarehouseLegend,
                        child: const Icon(
                          Icons.info_outline,
                          color: Color(0xFF00C2EB),
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                if (currentFloor != null)
                  _buildWarehouseMapCard(
                    floor: currentFloor,
                    chariotsOnFloor: chariotsOnFloor,
                    highlightedChariotCode: _selectedMonitorChariotCode,
                  )
                else
                  _buildEmptyState(textTheme, 'No floor structure found.'),
                const SizedBox(height: 16),
                if (floors.length > 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: floorIndex > 0
                            ? () => setState(() => _selectedMonitorFloorIndex--)
                            : null,
                        icon: const Icon(Icons.chevron_left),
                      ),
                      Text(
                        currentFloor?.label ?? 'Floor',
                        style: GoogleFonts.manrope(
                          fontSize: 20 * 0.75,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF74839A),
                        ),
                      ),
                      IconButton(
                        onPressed: floorIndex < floors.length - 1
                            ? () => setState(() => _selectedMonitorFloorIndex++)
                            : null,
                        icon: const Icon(Icons.chevron_right),
                      ),
                    ],
                  )
                else if (currentFloor != null)
                  Center(
                    child: Text(
                      currentFloor.label,
                      style: GoogleFonts.manrope(
                        fontSize: 20 * 0.75,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF74839A),
                      ),
                    ),
                  ),
                const SizedBox(height: 6),
                if (floors.length > 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(floors.length, (index) {
                      final active = index == floorIndex;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: active
                              ? const Color(0xFFB7C2D0)
                              : const Color(0xFFD8E0EA),
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                if (selectedChariot != null) ...[
                  const SizedBox(height: 16),
                  _buildSelectedChariotCard(selectedChariot),
                ],
                const SizedBox(height: 22),
                Text(
                  'All Orders',
                  style: GoogleFonts.manrope(
                    fontSize: 44 * 0.75,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 14),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: MonitorOrderFilter.values.map((filter) {
                      final isSelected = _monitorOrderFilter == filter;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(28),
                          onTap: () {
                            setState(() {
                              _monitorOrderFilter = filter;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF004C5C)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: const Color(0xFF004C5C),
                                width: 2,
                              ),
                            ),
                            child: Text(
                              filter.label,
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF004C5C),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 14),
                if (filteredOrders.isEmpty)
                  _buildEmptyState(
                    textTheme,
                    'No orders found for this filter.',
                  )
                else
                  ...filteredOrders.map(
                    (order) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildMonitorOrderCard(order),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWarehouseMapCard({
    required _MonitorFloorData floor,
    required List<_MonitorChariotData> chariotsOnFloor,
    String? highlightedChariotCode,
  }) {
    final selected = highlightedChariotCode == null
        ? null
        : chariotsOnFloor
              .where((entry) => entry.code == highlightedChariotCode)
              .cast<_MonitorChariotData?>()
              .firstWhere((value) => value != null, orElse: () => null);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFD7DEE8),
        borderRadius: BorderRadius.circular(18),
      ),
      child: AspectRatio(
        aspectRatio: floor.columns / floor.rows,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cellWidth = constraints.maxWidth / floor.columns;
            final cellHeight = constraints.maxHeight / floor.rows;

            return Stack(
              children: [
                GridView.builder(
                  itemCount: floor.cells.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: floor.columns,
                    childAspectRatio: cellWidth / cellHeight,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemBuilder: (context, index) {
                    final cell = floor.cells[index];
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: cell.color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  },
                ),
                if (selected != null && selected.path.length > 1)
                  IgnorePointer(
                    child: CustomPaint(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      painter: _MonitorPathPainter(
                        path: selected.path,
                        rows: floor.rows,
                        columns: floor.columns,
                      ),
                    ),
                  ),
                ...chariotsOnFloor.map((chariot) {
                  final left = ((chariot.column - 1) * cellWidth)
                      .clamp(0, constraints.maxWidth - 18)
                      .toDouble();
                  final top = ((chariot.row - 1) * cellHeight)
                      .clamp(0, constraints.maxHeight - 18)
                      .toDouble();
                  final isActive = chariot.active;
                  final isSelected = highlightedChariotCode == chariot.code;

                  return Positioned(
                    left: left,
                    top: top,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMonitorChariotCode = chariot.code;
                        });
                      },
                      child: Container(
                        width: isSelected ? 20 : 18,
                        height: isSelected ? 20 : 18,
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFFEF4444)
                              : const Color(0xFFA3A3A3),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF004C5C)
                                : Colors.white,
                            width: isSelected ? 3 : 2,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSelectedChariotCard(_MonitorChariotData chariot) {
    final routeSummary = chariot.path.length < 2
        ? 'No route points'
        : '${chariot.path.length} points • '
              '(${chariot.path.first.row},${chariot.path.first.column}) → '
              '(${chariot.path.last.row},${chariot.path.last.column})';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chariot ${chariot.code}',
            style: GoogleFonts.manrope(
              fontSize: 20 * 0.75,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 14),
          _monitorInfoRow(
            Icons.person_outline,
            'Employee',
            chariot.employeeName,
          ),
          _monitorInfoRow(
            Icons.inventory_2_outlined,
            'Transfer ID',
            chariot.transferId,
          ),
          _monitorInfoRow(
            Icons.location_on_outlined,
            'Location',
            chariot.locationLabel,
          ),
          if (chariot.startedAt != null)
            _monitorInfoRow(
              Icons.schedule,
              'Started',
              _minutesAgoLabel(chariot.startedAt!),
            ),
          _monitorInfoRow(
            Icons.near_me_outlined,
            'Last Known Position',
            chariot.lastKnownPosition,
          ),
          _monitorInfoRow(Icons.alt_route, 'Route', routeSummary),
        ],
      ),
    );
  }

  Widget _monitorInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF3F8DA8)),
          const SizedBox(width: 10),
          Text(
            '$label: ',
            style: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF334155),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.manrope(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0F172A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonitorOrderCard(_MonitorOrderData order) {
    final statusColor = order.status.color;
    final isExpanded = _expandedMonitorOrderIds.contains(order.id);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (expanded) {
            setState(() {
              if (expanded) {
                _expandedMonitorOrderIds.add(order.id);
              } else {
                _expandedMonitorOrderIds.remove(order.id);
              }
            });
          },
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Icon(order.icon, color: statusColor, size: 24),
          title: Text(
            '${order.title} - ${order.displayId}',
            style: GoogleFonts.manrope(
              fontSize: 18 * 0.75,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF334155),
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: const Color(0xFF94A3B8),
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Employee Username: ${order.employeeName}',
                style: GoogleFonts.manrope(
                  fontSize: 16 * 0.75,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF8A9AAE),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Warehouse: ${order.warehouseLabel}',
                style: GoogleFonts.manrope(
                  fontSize: 16 * 0.75,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF8A9AAE),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Product:',
                    style: GoogleFonts.manrope(
                      fontSize: 16 * 0.75,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF8A9AAE),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Quantity:',
                    style: GoogleFonts.manrope(
                      fontSize: 16 * 0.75,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF8A9AAE),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...order.products.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        entry.product,
                        style: GoogleFonts.manrope(
                          fontSize: 16 * 0.75,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF8A9AAE),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        entry.quantity.toString(),
                        style: GoogleFonts.manrope(
                          fontSize: 16 * 0.75,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF8A9AAE),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<_MonitorDataBundle> _loadMonitorData() async {
    final remoteFloorLayout = await _loadAdminConfiguredFloors();

    final warehouses = await _isar.warehouseCollections.where().findAll();
    final floors = await _isar.floorCollections.where().findAll();
    final sections = await _isar.sectionCollections.where().findAll();
    final slots = await _isar.slotCollections.where().findAll();
    final locations = await _isar.locationCollections.where().findAll();
    final zones = await _isar.zoneCollections.where().findAll();
    final chariots = await _isar.chariotCollections.where().findAll();
    final assignments = await _isar.chariotAssignmentCollections
        .where()
        .findAll();

    final users = await _isar.userCollections.where().findAll();
    final skus = await _isar.sKUCollections.where().findAll();
    final reports = await _isar.taskReportCollections.where().findAll();

    final commandes = await _isar.bonCommandeCollections.where().findAll();
    final commandeItems = await _isar.bonCommandeItemCollections
        .where()
        .findAll();
    final replenishments = await _isar.bonReplenishmentCollections
        .where()
        .findAll();
    final replenishmentItems = await _isar.bonReplenishmentItemCollections
        .where()
        .findAll();
    final pickings = await _isar.bonPickingCollections.where().findAll();
    final pickingItems = await _isar.bonPickingItemCollections
        .where()
        .findAll();
    final livraisons = await _isar.bonLivraisonCollections.where().findAll();
    final livraisonItems = await _isar.bonLivraisonItemCollections
        .where()
        .findAll();
    final employeeTasks = await _isar.employeeTaskCollections.where().findAll();

    final selectedWarehouseId = _supervisorWarehouseId;

    List<ChariotApiModel> remoteChariots = const [];
    if (_isOnline) {
      try {
        final remoteResponse = await _chariotRemoteDatasource.getChariots(
          pageSize: 500,
        );
        remoteChariots = remoteResponse.results;
      } catch (_) {}
    }

    bool idMatches(String? value, {required int localId, String? backendId}) {
      if (value == null || value.isEmpty) return false;
      return value == localId.toString() ||
          (backendId != null && value == backendId);
    }

    String compactId(String? backendId, int localId) {
      if (backendId != null && backendId.isNotEmpty) {
        return backendId.split('-').first.toUpperCase();
      }
      return localId.toString();
    }

    bool matchesSelectedWarehouse(String? warehouseId) {
      if (selectedWarehouseId == null || selectedWarehouseId.isEmpty) {
        return true;
      }
      if (warehouseId == null || warehouseId.isEmpty) return false;
      if (warehouseId == selectedWarehouseId) return true;

      final normalizedWarehouseId = warehouseId.trim().toLowerCase();
      final normalizedSelected = selectedWarehouseId.trim().toLowerCase();
      if (normalizedWarehouseId == normalizedSelected) return true;

      final selectedWarehouse = warehouses
          .where(
            (warehouse) =>
                warehouse.backendId == selectedWarehouseId ||
                warehouse.id.toString() == selectedWarehouseId ||
                warehouse.code == selectedWarehouseId,
          )
          .cast<WarehouseCollection?>()
          .firstWhere((value) => value != null, orElse: () => null);

      if (selectedWarehouse == null) return false;

      final aliases = <String>{
        selectedWarehouse.id.toString().toLowerCase(),
        selectedWarehouse.code.toLowerCase(),
        if (selectedWarehouse.backendId != null)
          selectedWarehouse.backendId!.toLowerCase(),
      };

      return aliases.contains(normalizedWarehouseId);
    }

    String normalizeChariotCode(String value) {
      return value.trim().replaceFirst(RegExp(r'^#'), '').toUpperCase();
    }

    List<Map<String, dynamic>> normalizeApiRows(dynamic payload) {
      if (payload is List) {
        return payload.whereType<Map>().map((row) {
          return Map<String, dynamic>.from(row);
        }).toList();
      }

      if (payload is Map) {
        final mapPayload = Map<String, dynamic>.from(payload);
        final results = mapPayload['results'];
        if (results is List) {
          return results.whereType<Map>().map((row) {
            return Map<String, dynamic>.from(row);
          }).toList();
        }
      }

      return const [];
    }

    MonitorOrderStatus monitorStatusFromBackend(String? rawStatus) {
      final status = rawStatus?.trim().toUpperCase() ?? '';
      if (status.contains('IN_PROGRESS') ||
          status.contains('EN_PICKING') ||
          status.contains('EN_REPLENISSEMENT')) {
        return MonitorOrderStatus.inProgress;
      }
      if (status.contains('COMPLETE') ||
          status.contains('COMPLETED') ||
          status == 'DONE') {
        return MonitorOrderStatus.complete;
      }
      if (status.contains('FAILED') ||
          status.contains('CANCEL') ||
          status.contains('ANNULE')) {
        return MonitorOrderStatus.reported;
      }
      return MonitorOrderStatus.pending;
    }

    int parseQuantity(dynamic value) {
      if (value is int) return value;
      if (value is num) return value.round();
      if (value == null) return 0;
      return int.tryParse(value.toString()) ?? 0;
    }

    final userMap = <String, String>{};
    for (final user in users) {
      userMap[user.id.toString()] = user.fullName;
      if (user.backendId != null && user.backendId!.isNotEmpty) {
        userMap[user.backendId!] = user.fullName;
      }
    }

    final warehouseNameMap = <String, String>{};
    for (final warehouse in warehouses) {
      warehouseNameMap[warehouse.id.toString()] = warehouse.name;
      if (warehouse.backendId != null && warehouse.backendId!.isNotEmpty) {
        warehouseNameMap[warehouse.backendId!] = warehouse.name;
      }
      warehouseNameMap[warehouse.code] = warehouse.name;
    }

    String? tryResolveWarehouseName(String? warehouseId) {
      if (warehouseId == null || warehouseId.isEmpty) return null;
      final direct = warehouseNameMap[warehouseId];
      if (direct != null && direct.trim().isNotEmpty) return direct;

      final normalized = warehouseId.trim();
      final caseInsensitive = warehouseNameMap.entries
          .where((entry) => entry.key.toLowerCase() == normalized.toLowerCase())
          .map((entry) => entry.value)
          .cast<String?>()
          .firstWhere(
            (value) => value != null && value.trim().isNotEmpty,
            orElse: () => null,
          );
      return caseInsensitive;
    }

    String resolveWarehouseName(String? warehouseId) {
      return tryResolveWarehouseName(warehouseId) ?? 'Unknown Warehouse';
    }

    void addWarehouseCandidate(Set<String> target, String? value) {
      if (value == null) return;
      final candidate = value.trim();
      if (candidate.isEmpty) return;
      if (tryResolveWarehouseName(candidate) != null) return;
      target.add(candidate);
    }

    final unresolvedWarehouseIds = <String>{};
    addWarehouseCandidate(unresolvedWarehouseIds, _supervisorWarehouseId);
    for (final floor in remoteFloorLayout) {
      addWarehouseCandidate(unresolvedWarehouseIds, floor.warehouseId);
    }
    for (final item in commandes) {
      addWarehouseCandidate(unresolvedWarehouseIds, item.warehouseId);
    }
    for (final item in replenishments) {
      addWarehouseCandidate(unresolvedWarehouseIds, item.warehouseId);
    }
    for (final item in pickings) {
      addWarehouseCandidate(unresolvedWarehouseIds, item.warehouseId);
    }
    for (final item in livraisons) {
      addWarehouseCandidate(unresolvedWarehouseIds, item.warehouseId);
    }
    for (final task in employeeTasks) {
      addWarehouseCandidate(unresolvedWarehouseIds, task.warehouseId);
    }

    if (_isOnline && unresolvedWarehouseIds.isNotEmpty) {
      try {
        final remoteWarehouses = await _warehouseRemoteDatasource
            .getWarehouses();
        for (final warehouse in remoteWarehouses) {
          if (warehouse.name.trim().isEmpty) continue;
          warehouseNameMap[warehouse.id] = warehouse.name;
          warehouseNameMap[warehouse.code] = warehouse.name;
        }
      } catch (_) {}
    }

    final skuMap = <String, String>{};
    for (final sku in skus) {
      skuMap[sku.id.toString()] = sku.skuCode;
      if (sku.backendId != null && sku.backendId!.isNotEmpty) {
        skuMap[sku.backendId!] = sku.skuCode;
      }
    }

    final reportedTaskIds = reports
        .where(
          (report) =>
              report.taskId != null &&
              (report.status == TaskReportStatus.pending ||
                  report.status == TaskReportStatus.acknowledged),
        )
        .map((entry) => entry.taskId!)
        .toSet();

    final scopedLocalFloors = floors
        .where((floor) => matchesSelectedWarehouse(floor.warehouseId))
        .toList();
    final scopedFloorIds = scopedLocalFloors
        .map((floor) => floor.backendId ?? floor.id.toString())
        .toSet();
    final scopedSections = sections
        .where((section) => scopedFloorIds.contains(section.floorId))
        .toList();
    final scopedSlots = slots
        .where((slot) => scopedFloorIds.contains(slot.floorId))
        .toList();
    final scopedLocations = locations
        .where((location) => matchesSelectedWarehouse(location.warehouseId))
        .toList();

    bool remoteFloorsMatchSelectedWarehouse(List<FloorApiModel> remoteFloors) {
      if (remoteFloors.isEmpty) return false;
      return remoteFloors.every(
        (floor) =>
            floor.warehouseId.isNotEmpty &&
            matchesSelectedWarehouse(floor.warehouseId),
      );
    }

    final useRemoteFloorData = remoteFloorsMatchSelectedWarehouse(
      remoteFloorLayout,
    );

    final floorData = useRemoteFloorData
        ? _buildMonitorFloorsFromAdmin(remoteFloorLayout)
        : _buildMonitorFloors(
            floors: scopedLocalFloors,
            sections: scopedSections,
            slots: scopedSlots,
            locations: scopedLocations,
          );
    String? apiWarehouseName;
    for (final floor in remoteFloorLayout) {
      if (!matchesSelectedWarehouse(floor.warehouseId)) continue;
      final candidate = floor.warehouseName?.trim();
      if (candidate != null && candidate.isNotEmpty) {
        apiWarehouseName = candidate;
        break;
      }
    }

    final localFloorWarehouseIds = floors
        .map((floor) => floor.warehouseId)
        .where((id) => id.isNotEmpty)
        .toSet()
        .toList();

    final activeWarehouseNameCandidate =
        apiWarehouseName ??
        tryResolveWarehouseName(selectedWarehouseId) ??
        (remoteFloorLayout.isNotEmpty
            ? tryResolveWarehouseName(remoteFloorLayout.first.warehouseId)
            : null) ??
        localFloorWarehouseIds
            .map(tryResolveWarehouseName)
            .cast<String?>()
            .firstWhere(
              (value) => value != null && value.trim().isNotEmpty,
              orElse: () => null,
            ) ??
        warehouses
            .map((warehouse) => warehouse.name)
            .cast<String?>()
            .firstWhere(
              (value) => value != null && value.trim().isNotEmpty,
              orElse: () => null,
            );

    final locationResolver = _MonitorLocationResolver(
      floors: floors,
      slots: slots,
      locations: locations,
      zones: zones,
    );

    final remoteChariotByCode = <String, ChariotApiModel>{};
    for (final remote in remoteChariots) {
      final normalizedCode = normalizeChariotCode(remote.code);
      if (normalizedCode.isEmpty) continue;
      remoteChariotByCode[normalizedCode] = remote;
    }

    final orders = <_MonitorOrderData>[];

    for (final item in commandes) {
      if (!matchesSelectedWarehouse(item.warehouseId)) continue;
      final itemRows = commandeItems
          .where(
            (entry) => idMatches(
              entry.bonCommandeId,
              localId: item.id,
              backendId: item.backendId,
            ),
          )
          .toList();

      final location = const _MonitorResolvedLocation(
        floorLevel: 0,
        locationLabel: 'Ground Floor, Receiving Zone',
        lastKnownPosition: 'Receiving Zone',
      );

      final orderStatus = reportedTaskIds.contains(item.backendId)
          ? MonitorOrderStatus.reported
          : switch (item.status) {
              BonCommandeStatus.pending => MonitorOrderStatus.pending,
              BonCommandeStatus.inProgress => MonitorOrderStatus.inProgress,
              BonCommandeStatus.completed => MonitorOrderStatus.complete,
            };
      final routeNodes = _deriveMonitorRouteNodesFromNotes(
        notes: item.notes,
        status: orderStatus,
      );

      orders.add(
        _MonitorOrderData(
          id: 'commande-${item.id}',
          title: 'Command Order',
          displayId: compactId(item.backendId, item.id),
          warehouseName: resolveWarehouseName(item.warehouseId),
          employeeName: userMap[item.employeeId] ?? 'Unknown',
          status: orderStatus,
          products: itemRows.isEmpty
              ? [const _MonitorProductLine(product: 'SKU', quantity: 0)]
              : itemRows
                    .map(
                      (entry) => _MonitorProductLine(
                        product: skuMap[entry.skuId] ?? entry.skuId,
                        quantity: entry.quantityExpected,
                      ),
                    )
                    .toList(),
          floorLevel: location.floorLevel,
          row: null,
          column: null,
          locationLabel: location.locationLabel,
          lastKnownPosition: location.lastKnownPosition,
          icon: Icons.inventory_2_outlined,
          referenceId: item.backendId ?? item.id.toString(),
          routeNodes: routeNodes,
        ),
      );
    }

    for (final item in replenishments) {
      if (!matchesSelectedWarehouse(item.warehouseId)) continue;
      final itemRows = replenishmentItems
          .where(
            (entry) => idMatches(
              entry.bonReplenishmentId,
              localId: item.id,
              backendId: item.backendId,
            ),
          )
          .toList();
      final location = locationResolver.resolve(
        itemRows.map((entry) => entry.toLocationId),
      );

      final orderStatus = reportedTaskIds.contains(item.backendId)
          ? MonitorOrderStatus.reported
          : switch (item.status) {
              BonReplenishmentStatus.pending => MonitorOrderStatus.pending,
              BonReplenishmentStatus.inProgress =>
                MonitorOrderStatus.inProgress,
              BonReplenishmentStatus.completed => MonitorOrderStatus.complete,
              BonReplenishmentStatus.cancelled => MonitorOrderStatus.complete,
            };
      final routeNodes = _deriveMonitorRouteNodesFromNotes(
        notes: item.notes,
        status: orderStatus,
      );

      orders.add(
        _MonitorOrderData(
          id: 'replenishment-${item.id}',
          title: 'Transfer Order',
          displayId: compactId(item.backendId, item.id),
          warehouseName: resolveWarehouseName(item.warehouseId),
          employeeName: userMap[item.employeeId] ?? 'Unknown',
          status: orderStatus,
          products: itemRows.isEmpty
              ? [const _MonitorProductLine(product: 'SKU', quantity: 0)]
              : itemRows
                    .map(
                      (entry) => _MonitorProductLine(
                        product: skuMap[entry.skuId] ?? entry.skuId,
                        quantity: entry.quantity,
                      ),
                    )
                    .toList(),
          floorLevel: location.floorLevel,
          row: location.row,
          column: location.column,
          locationLabel: location.locationLabel,
          lastKnownPosition: location.lastKnownPosition,
          icon: Icons.inventory_outlined,
          referenceId: item.backendId ?? item.id.toString(),
          routeNodes: routeNodes,
        ),
      );
    }

    for (final item in pickings) {
      if (!matchesSelectedWarehouse(item.warehouseId)) continue;
      final itemRows = pickingItems
          .where(
            (entry) => idMatches(
              entry.bonPickingId,
              localId: item.id,
              backendId: item.backendId,
            ),
          )
          .toList();
      final location = locationResolver.resolve(
        itemRows.map((entry) => entry.locationId),
      );

      final orderStatus = reportedTaskIds.contains(item.backendId)
          ? MonitorOrderStatus.reported
          : switch (item.status) {
              BonPickingStatus.pending => MonitorOrderStatus.pending,
              BonPickingStatus.inProgress => MonitorOrderStatus.inProgress,
              BonPickingStatus.completed => MonitorOrderStatus.complete,
              BonPickingStatus.cancelled => MonitorOrderStatus.complete,
            };
      final routeNodes = _deriveMonitorRouteNodesFromNotes(
        notes: item.notes,
        status: orderStatus,
      );

      orders.add(
        _MonitorOrderData(
          id: 'picking-${item.id}',
          title: 'Picking Order',
          displayId: compactId(item.backendId, item.id),
          warehouseName: resolveWarehouseName(item.warehouseId),
          employeeName: userMap[item.employeeId] ?? 'Unknown',
          status: orderStatus,
          products: itemRows.isEmpty
              ? [const _MonitorProductLine(product: 'SKU', quantity: 0)]
              : itemRows
                    .map(
                      (entry) => _MonitorProductLine(
                        product: skuMap[entry.skuId] ?? entry.skuId,
                        quantity: entry.quantity,
                      ),
                    )
                    .toList(),
          floorLevel: location.floorLevel,
          row: location.row,
          column: location.column,
          locationLabel: location.locationLabel,
          lastKnownPosition: location.lastKnownPosition,
          icon: Icons.route_outlined,
          referenceId: item.backendId ?? item.id.toString(),
          routeNodes: routeNodes,
        ),
      );
    }

    for (final item in livraisons) {
      if (!matchesSelectedWarehouse(item.warehouseId)) continue;
      final itemRows = livraisonItems
          .where(
            (entry) => idMatches(
              entry.bonLivraisonId,
              localId: item.id,
              backendId: item.backendId,
            ),
          )
          .toList();
      final location = const _MonitorResolvedLocation(
        floorLevel: 0,
        locationLabel: 'Ground Floor, Expedition Zone',
        lastKnownPosition: 'Expedition Zone',
      );

      final orderStatus = reportedTaskIds.contains(item.backendId)
          ? MonitorOrderStatus.reported
          : switch (item.status) {
              BonLivraisonStatus.idle => MonitorOrderStatus.pending,
              BonLivraisonStatus.inProgress => MonitorOrderStatus.inProgress,
              BonLivraisonStatus.done => MonitorOrderStatus.complete,
              BonLivraisonStatus.failed => MonitorOrderStatus.reported,
            };
      final routeNodes = _deriveMonitorRouteNodesFromNotes(
        notes: item.notes,
        status: orderStatus,
      );

      orders.add(
        _MonitorOrderData(
          id: 'livraison-${item.id}',
          title: 'Delivery Order',
          displayId: compactId(item.backendId, item.id),
          warehouseName: resolveWarehouseName(item.warehouseId),
          employeeName: userMap[item.employeeId] ?? 'Unknown',
          status: orderStatus,
          products: itemRows.isEmpty
              ? [const _MonitorProductLine(product: 'SKU', quantity: 0)]
              : itemRows
                    .map(
                      (entry) => _MonitorProductLine(
                        product: skuMap[entry.skuId] ?? entry.skuId,
                        quantity: entry.quantityDelivered,
                      ),
                    )
                    .toList(),
          floorLevel: location.floorLevel,
          row: null,
          column: null,
          locationLabel: location.locationLabel,
          lastKnownPosition: location.lastKnownPosition,
          icon: Icons.local_shipping_outlined,
          referenceId: item.backendId ?? item.id.toString(),
          routeNodes: routeNodes,
        ),
      );
    }

    for (final task in employeeTasks) {
      if (!matchesSelectedWarehouse(task.warehouseId)) continue;
      final baseStatus = switch (task.status) {
        EmployeeTaskStatus.pending => MonitorOrderStatus.pending,
        EmployeeTaskStatus.inProgress => MonitorOrderStatus.inProgress,
        EmployeeTaskStatus.completed => MonitorOrderStatus.complete,
        EmployeeTaskStatus.cancelled => MonitorOrderStatus.reported,
      };
      final orderStatus = reportedTaskIds.contains(task.backendId)
          ? MonitorOrderStatus.reported
          : baseStatus;
      final routeNodes = _deriveMonitorRouteNodesFromNotes(
        notes: task.notes,
        status: orderStatus,
      );

      final title = switch (task.taskType) {
        EmployeeTaskType.receipt => 'Command Order',
        EmployeeTaskType.storage ||
        EmployeeTaskType.replenishment => 'Transfer Order',
        EmployeeTaskType.picking ||
        EmployeeTaskType.preparation => 'Picking Order',
        EmployeeTaskType.delivery => 'Delivery Order',
      };

      final typeIcon = switch (task.taskType) {
        EmployeeTaskType.receipt => Icons.inventory_2_outlined,
        EmployeeTaskType.storage ||
        EmployeeTaskType.replenishment => Icons.inventory_outlined,
        EmployeeTaskType.picking ||
        EmployeeTaskType.preparation => Icons.route_outlined,
        EmployeeTaskType.delivery => Icons.local_shipping_outlined,
      };

      orders.add(
        _MonitorOrderData(
          id: 'employee-${task.id}',
          title: title,
          displayId: compactId(task.backendId, task.id),
          warehouseName: resolveWarehouseName(task.warehouseId),
          employeeName: userMap[task.assignedToUserId] ?? 'Unknown',
          status: orderStatus,
          products: [
            _MonitorProductLine(
              product: task.title.isEmpty ? 'SKU' : task.title,
              quantity: task.itemsCount,
            ),
          ],
          floorLevel: 0,
          row: null,
          column: null,
          locationLabel: 'Ground Floor',
          lastKnownPosition: 'Expedition Zone',
          icon: typeIcon,
          referenceId: task.backendId ?? task.id.toString(),
          routeNodes: routeNodes,
        ),
      );
    }

    final remoteAssignmentByChariotCode = <String, Map<String, String>>{};
    final remoteOrderByReferenceId = <String, _MonitorOrderData>{};

    if (_isOnline) {
      try {
        final assignmentsResponse = await _apiClient.get(
          '/v1/operations/assignments/active/',
          queryParameters: {'page_size': 500},
        );

        final assignmentRows = normalizeApiRows(assignmentsResponse.data);
        final replenishmentRefs = <String>{};
        final pickingRefs = <String>{};

        for (final row in assignmentRows) {
          final chariotCode = normalizeChariotCode(
            row['chariot_code']?.toString() ?? '',
          );
          final referenceId = row['reference_id']?.toString().trim() ?? '';
          final operationType =
              row['operation_type']?.toString().trim().toUpperCase() ?? '';

          if (chariotCode.isEmpty || referenceId.isEmpty) continue;

          remoteAssignmentByChariotCode[chariotCode] = {
            'referenceId': referenceId,
            'operationType': operationType,
          };

          if (operationType == 'REPLENISHMENT') {
            replenishmentRefs.add(referenceId);
          } else if (operationType == 'PICKING') {
            pickingRefs.add(referenceId);
          }
        }

        Future<Map<String, dynamic>?> fetchDetail(String endpoint) async {
          try {
            final detailResponse = await _apiClient.get(
              endpoint,
              options: Options(
                validateStatus: (status) => (status ?? 0) < 500,
              ),
            );
            if (detailResponse.statusCode == 404) {
              return null;
            }
            if (detailResponse.data is Map) {
              return Map<String, dynamic>.from(detailResponse.data as Map);
            }
          } catch (_) {}
          return null;
        }

        Future<void> loadRemoteOrder({
          required String referenceId,
          required String title,
          required IconData icon,
          required String endpoint,
          required String operationType,
        }) async {
          final detail = await fetchDetail(endpoint);
          if (detail == null) return;

          final status = monitorStatusFromBackend(
            detail['status']?.toString(),
          );
          final routeNodes = _deriveMonitorRouteNodesFromNotes(
            notes: detail['notes']?.toString(),
            status: status,
          );

          final locationCode = routeNodes.reversed
              .firstWhere((node) => node.trim().isNotEmpty, orElse: () => '')
              .trim();
          final resolvedLocation = locationCode.isEmpty
              ? const _MonitorResolvedLocation(
                  floorLevel: 0,
                  locationLabel: 'Unknown location',
                  lastKnownPosition: 'Unknown',
                )
              : locationResolver.resolve([locationCode]);

          final items = (detail['items'] is List)
              ? (detail['items'] as List)
                    .whereType<Map>()
                .map((entry) => Map<String, dynamic>.from(entry))
                    .toList()
              : const <Map<String, dynamic>>[];

          final products = items.isEmpty
              ? [const _MonitorProductLine(product: 'SKU', quantity: 0)]
              : items.map((entry) {
                  final skuCode =
                      entry['sku_code']?.toString() ??
                      entry['sku']?.toString() ??
                      'SKU';
                  final quantity = operationType == 'PICKING'
                      ? parseQuantity(entry['quantity_requested'])
                      : parseQuantity(entry['quantity']);
                  return _MonitorProductLine(product: skuCode, quantity: quantity);
                }).toList();

          final numero = detail['numero']?.toString().trim();
          final warehouseId = detail['warehouse']?.toString();
          remoteOrderByReferenceId[referenceId] = _MonitorOrderData(
            id: 'remote-$referenceId',
            title: title,
            displayId:
                (numero != null && numero.isNotEmpty)
                ? numero
                : referenceId.split('-').first.toUpperCase(),
            warehouseName:
              warehouseId != null && warehouseId.isNotEmpty
              ? resolveWarehouseName(warehouseId)
              : (activeWarehouseNameCandidate ?? 'Unknown Warehouse'),
            employeeName: detail['assigned_to_name']?.toString().trim().isNotEmpty ==
                    true
                ? detail['assigned_to_name'].toString().trim()
                : 'Unknown',
            status: status,
            products: products,
            floorLevel: resolvedLocation.floorLevel,
            row: resolvedLocation.row,
            column: resolvedLocation.column,
            locationLabel: resolvedLocation.locationLabel,
            lastKnownPosition: resolvedLocation.lastKnownPosition,
            icon: icon,
            referenceId: referenceId,
            routeNodes: routeNodes,
          );
        }

        for (final referenceId in replenishmentRefs) {
          await loadRemoteOrder(
            referenceId: referenceId,
            title: 'Transfer Order',
            icon: Icons.inventory_outlined,
            endpoint: '/bon-replenishment/$referenceId/',
            operationType: 'REPLENISHMENT',
          );
        }

        for (final referenceId in pickingRefs) {
          await loadRemoteOrder(
            referenceId: referenceId,
            title: 'Picking Order',
            icon: Icons.route_outlined,
            endpoint: '/bon-picking/$referenceId/',
            operationType: 'PICKING',
          );
        }
      } catch (_) {}
    }

    orders.sort((a, b) => b.id.compareTo(a.id));

    final orderReferenceIds = orders.map((order) => order.referenceId).toSet();

    final activeAssignments = assignments
        .where((entry) => entry.isActive)
        .toList();
    final monitorChariots = <_MonitorChariotData>[];
    final processedChariotCodes = <String>{};

    for (final chariot in chariots) {
      final normalizedCode = normalizeChariotCode(chariot.code);
      processedChariotCodes.add(normalizedCode);
      final remoteChariot = remoteChariotByCode[normalizedCode];

      final assignment = activeAssignments
          .where(
            (entry) => idMatches(
              entry.chariotId,
              localId: chariot.id,
              backendId: chariot.backendId,
            ),
          )
          .cast<ChariotAssignmentCollection?>()
          .firstWhere((value) => value != null, orElse: () => null);
      final remoteAssignment = remoteAssignmentByChariotCode[normalizedCode];

      final referenceCandidates = <String>{
        if (assignment?.referenceDocumentId != null &&
            assignment!.referenceDocumentId!.trim().isNotEmpty)
          assignment.referenceDocumentId!.trim(),
        if (remoteAssignment != null &&
            (remoteAssignment['referenceId']?.trim().isNotEmpty ?? false))
          remoteAssignment['referenceId']!.trim(),
      };

      _MonitorOrderData? linkedOrder;
      if (referenceCandidates.isNotEmpty) {
        linkedOrder = orders
            .where(
              (order) =>
                  referenceCandidates.contains(order.referenceId) ||
                  referenceCandidates.contains(order.displayId),
            )
            .cast<_MonitorOrderData?>()
            .firstWhere((value) => value != null, orElse: () => null);

        if (linkedOrder == null) {
          for (final referenceId in referenceCandidates) {
            final remoteOrder = remoteOrderByReferenceId[referenceId];
            if (remoteOrder != null) {
              linkedOrder = remoteOrder;
              break;
            }
          }
        }
      }

      final hasLinkedReference = referenceCandidates.any(
        (referenceId) =>
            orderReferenceIds.contains(referenceId) ||
            remoteOrderByReferenceId.containsKey(referenceId),
      );
      if (assignment != null &&
          !hasLinkedReference &&
          remoteAssignment == null) {
        continue;
      }

      if (assignment == null && remoteChariot == null) {
        continue;
      }

      final resolvedCurrentLocation = locationResolver.resolve([
        if (remoteChariot?.currentLocation != null &&
            remoteChariot!.currentLocation!.trim().isNotEmpty)
          remoteChariot.currentLocation!.trim(),
        if (remoteChariot?.locationCode != null &&
            remoteChariot!.locationCode!.trim().isNotEmpty)
          remoteChariot.locationCode!.trim(),
      ]);

      final hasResolvedCurrentLocation =
          resolvedCurrentLocation.locationLabel != 'Unknown location';

      final floorLevel = hasResolvedCurrentLocation
          ? resolvedCurrentLocation.floorLevel
          : (linkedOrder?.floorLevel ?? 0);
      final floorForBounds = floorData
          .where((entry) => entry.level == floorLevel)
          .cast<_MonitorFloorData?>()
          .firstWhere(
            (value) => value != null,
            orElse: () => floorData.isNotEmpty ? floorData.first : null,
          );
      final rows = floorForBounds?.rows ?? 16;
      final cols = floorForBounds?.columns ?? 16;

      final expeditionPoint = _GridPoint(
        row: (rows - 1).clamp(1, rows),
        column: (cols - 1).clamp(1, cols),
      );

      final baseRow = (linkedOrder?.row ?? expeditionPoint.row).clamp(1, rows);
      final baseColumn = (linkedOrder?.column ?? expeditionPoint.column).clamp(
        1,
        cols,
      );

      final resolvedRow = resolvedCurrentLocation.row?.clamp(1, rows);
      final resolvedColumn = resolvedCurrentLocation.column?.clamp(1, cols);

      final routedPath = linkedOrder == null
          ? const <_GridPoint>[]
          : _buildPathFromRouteNodes(
              routeNodes: linkedOrder.routeNodes,
              resolver: locationResolver,
              floorLevel: floorLevel,
              rows: rows,
              columns: cols,
            );

      final path = routedPath;

      final marker = path.isNotEmpty
          ? path.last
          : _GridPoint(
              row: resolvedRow ?? baseRow,
              column: resolvedColumn ?? baseColumn,
            );

      final isRemoteActive =
          remoteChariot != null &&
          (remoteChariot.status.toUpperCase() == 'IN_USE' ||
              remoteChariot.status.toUpperCase() == 'BUSY');

      final locationLabel = hasResolvedCurrentLocation
          ? resolvedCurrentLocation.locationLabel
          : linkedOrder?.locationLabel ?? 'Unknown location';

      final lastKnownPosition = hasResolvedCurrentLocation
          ? resolvedCurrentLocation.lastKnownPosition
          : (remoteChariot?.currentPosition != null &&
                    remoteChariot!.currentPosition!.trim().isNotEmpty
                ? remoteChariot.currentPosition!.trim()
                : (linkedOrder?.lastKnownPosition ?? 'Unknown'));

      monitorChariots.add(
        _MonitorChariotData(
          code: '#${chariot.code}',
          active: assignment != null || remoteAssignment != null || isRemoteActive,
          floorLevel: floorLevel,
          row: marker.row,
          column: marker.column,
          employeeName:
              linkedOrder?.employeeName ??
              remoteChariot?.operatorName ??
              (assignment == null
                  ? 'Unassigned'
                  : (userMap[assignment.assignedToUserId] ?? 'Unknown')),
          transferId:
              linkedOrder?.displayId ??
              assignment?.referenceDocumentId ??
              remoteAssignment?['referenceId'] ??
              '-',
          locationLabel: locationLabel,
          startedAt: assignment?.assignedAt,
          lastKnownPosition: lastKnownPosition,
          path: path,
          debugReferenceId: referenceCandidates.isNotEmpty
              ? referenceCandidates.first
              : null,
          debugOperationType:
              (remoteAssignment?['operationType'] as String?) ??
              assignment?.operationType?.name ??
              'UNKNOWN',
          debugRouteNodeCount: linkedOrder?.routeNodes.length,
          debugDataSource:
              assignment != null && remoteAssignment != null
                  ? 'local+remote'
                  : (assignment != null
                      ? 'local'
                      : (remoteAssignment != null ? 'remote' : 'none')),
        ),
      );
    }

    for (final remote in remoteChariots) {
      final normalizedCode = normalizeChariotCode(remote.code);
      if (normalizedCode.isEmpty ||
          processedChariotCodes.contains(normalizedCode)) {
        continue;
      }

      final remoteAssignment = remoteAssignmentByChariotCode[normalizedCode];
      _MonitorOrderData? linkedOrder;
      if (remoteAssignment != null) {
        final referenceId = remoteAssignment['referenceId'];
        if (referenceId != null && referenceId.trim().isNotEmpty) {
          final normalizedRef = referenceId.trim();
          linkedOrder = orders
              .where(
                (order) =>
                    order.referenceId == normalizedRef ||
                    order.displayId == normalizedRef,
              )
              .cast<_MonitorOrderData?>()
              .firstWhere((value) => value != null, orElse: () => null);
          linkedOrder ??= remoteOrderByReferenceId[normalizedRef];
        }
      }

      final resolvedCurrentLocation = locationResolver.resolve([
        if (remote.currentLocation != null &&
            remote.currentLocation!.trim().isNotEmpty)
          remote.currentLocation!.trim(),
        if (remote.locationCode != null &&
            remote.locationCode!.trim().isNotEmpty)
          remote.locationCode!.trim(),
      ]);

        final hasResolvedCurrentLocation =
          resolvedCurrentLocation.locationLabel != 'Unknown location';
        final floorLevel = hasResolvedCurrentLocation
          ? resolvedCurrentLocation.floorLevel
          : (linkedOrder?.floorLevel ?? 0);
      final floorForBounds = floorData
          .where((entry) => entry.level == floorLevel)
          .cast<_MonitorFloorData?>()
          .firstWhere(
            (value) => value != null,
            orElse: () => floorData.isNotEmpty ? floorData.first : null,
          );
      final rows = floorForBounds?.rows ?? 16;
      final cols = floorForBounds?.columns ?? 16;

        final fallbackRow = (resolvedCurrentLocation.row ?? 1).clamp(1, rows);
        final fallbackColumn = (resolvedCurrentLocation.column ?? 1).clamp(1, cols);

        final routedPath = linkedOrder == null
          ? const <_GridPoint>[]
          : _buildPathFromRouteNodes(
            routeNodes: linkedOrder.routeNodes,
            resolver: locationResolver,
            floorLevel: floorLevel,
            rows: rows,
            columns: cols,
          );
        final marker = routedPath.isNotEmpty
          ? routedPath.last
          : _GridPoint(row: fallbackRow, column: fallbackColumn);

      monitorChariots.add(
        _MonitorChariotData(
          code: '#${remote.code}',
          active:
            remoteAssignment != null ||
              remote.status.toUpperCase() == 'IN_USE' ||
              remote.status.toUpperCase() == 'BUSY',
          floorLevel: floorLevel,
          row: marker.row,
          column: marker.column,
          employeeName:
            linkedOrder?.employeeName ??
            (remote.operatorName?.trim().isNotEmpty == true
              ? remote.operatorName!.trim()
              : 'Unassigned'),
          transferId:
            linkedOrder?.displayId ?? remoteAssignment?['referenceId'] ?? '-',
          locationLabel: hasResolvedCurrentLocation
            ? resolvedCurrentLocation.locationLabel
            : (linkedOrder?.locationLabel ?? resolvedCurrentLocation.locationLabel),
          startedAt: null,
          lastKnownPosition: remote.currentPosition?.trim().isNotEmpty == true
              ? remote.currentPosition!.trim()
            : (linkedOrder?.lastKnownPosition ??
              resolvedCurrentLocation.lastKnownPosition),
          path:
            routedPath.isNotEmpty
            ? routedPath
            : [_GridPoint(row: marker.row, column: marker.column)],
          debugReferenceId: remoteAssignment?['referenceId']?.toString(),
          debugOperationType: (remoteAssignment?['operationType'] as String?) ?? 'UNKNOWN',
          debugRouteNodeCount: linkedOrder?.routeNodes.length,
          debugDataSource: 'remote-only',
        ),
      );
    }

    final resolvedActiveWarehouseName =
        activeWarehouseNameCandidate ??
        orders
            .map((order) => order.warehouseName)
            .cast<String?>()
            .firstWhere(
              (value) =>
                  value != null &&
                  value.trim().isNotEmpty &&
                  value.trim().toLowerCase() != 'unknown warehouse',
              orElse: () => null,
            );

    return _MonitorDataBundle(
      floors: floorData,
      chariots: monitorChariots,
      orders: orders,
      activeWarehouseName: resolvedActiveWarehouseName,
    );
  }

  List<_GridPoint> _buildManhattanPath({
    required int startRow,
    required int startColumn,
    required int endRow,
    required int endColumn,
  }) {
    final path = <_GridPoint>[_GridPoint(row: startRow, column: startColumn)];

    if (startColumn != endColumn) {
      path.add(_GridPoint(row: startRow, column: endColumn));
    }

    if (startRow != endRow) {
      path.add(_GridPoint(row: endRow, column: endColumn));
    }

    return path;
  }

  List<_GridPoint> _buildPathFromRouteNodes({
    required List<String> routeNodes,
    required _MonitorLocationResolver resolver,
    required int floorLevel,
    required int rows,
    required int columns,
  }) {
    if (routeNodes.isEmpty) return const [];

    final resolved = <_GridPoint>[];
    for (final node in routeNodes) {
      final point = resolver.resolveRouteNodeToPoint(
        node: node,
        floorLevel: floorLevel,
        rows: rows,
        columns: columns,
      );
      if (point != null) {
        resolved.add(point);
      }
    }

    if (resolved.isEmpty) return const [];
    if (resolved.length == 1) return resolved;

    final path = <_GridPoint>[];
    for (var index = 0; index < resolved.length - 1; index++) {
      final from = resolved[index];
      final to = resolved[index + 1];
      final segment = _buildManhattanPath(
        startRow: from.row,
        startColumn: from.column,
        endRow: to.row,
        endColumn: to.column,
      );

      if (segment.isEmpty) continue;
      if (path.isEmpty) {
        path.addAll(segment);
      } else {
        path.addAll(segment.skip(1));
      }
    }

    return path.isEmpty ? resolved : path;
  }

  Future<List<FloorApiModel>> _loadAdminConfiguredFloors() async {
    if (!_isOnline) return const [];

    final localWarehouses = await _isar.warehouseCollections.where().findAll();

    String? warehouseId = _supervisorWarehouseId;
    if (warehouseId == null || warehouseId.isEmpty) {
      if (localWarehouses.isNotEmpty) {
        warehouseId =
            localWarehouses.first.backendId ??
            localWarehouses.first.id.toString();
      }
    }

    final attemptedWarehouseIds = <String>{};

    Future<List<FloorApiModel>> tryLoadFloorsForWarehouse(String? id) async {
      if (id == null || id.isEmpty || attemptedWarehouseIds.contains(id)) {
        return const [];
      }
      attemptedWarehouseIds.add(id);
      try {
        return await _floorRemoteDatasource.getFloors(id);
      } catch (_) {
        return const [];
      }
    }

    final primaryFloors = await tryLoadFloorsForWarehouse(warehouseId);
    if (primaryFloors.isNotEmpty) return primaryFloors;

    String? supervisorWarehouseName;
    if (warehouseId != null && warehouseId.isNotEmpty) {
      for (final local in localWarehouses) {
        final matches =
            warehouseId == local.id.toString() ||
            (local.backendId != null && warehouseId == local.backendId) ||
            warehouseId == local.code;
        if (!matches) continue;
        supervisorWarehouseName = local.name;
        break;
      }
    }

    final prioritizedLocal = <WarehouseCollection>[];
    final remainingLocal = <WarehouseCollection>[];
    for (final local in localWarehouses) {
      if (supervisorWarehouseName != null &&
          local.name.toLowerCase() == supervisorWarehouseName.toLowerCase()) {
        prioritizedLocal.add(local);
      } else {
        remainingLocal.add(local);
      }
    }

    for (final local in [...prioritizedLocal, ...remainingLocal]) {
      final floors = await tryLoadFloorsForWarehouse(
        local.backendId ?? local.id.toString(),
      );
      if (floors.isNotEmpty) return floors;
    }

    try {
      final remoteWarehouses = await _warehouseRemoteDatasource.getWarehouses();

      final prioritizedRemote = <WarehouseApiModel>[];
      final remainingRemote = <WarehouseApiModel>[];
      for (final remote in remoteWarehouses) {
        if (supervisorWarehouseName != null &&
            remote.name.toLowerCase() ==
                supervisorWarehouseName.toLowerCase()) {
          prioritizedRemote.add(remote);
        } else {
          remainingRemote.add(remote);
        }
      }

      for (final remote in [...prioritizedRemote, ...remainingRemote]) {
        final floors = await tryLoadFloorsForWarehouse(remote.id);
        if (floors.isNotEmpty) return floors;
      }
    } catch (_) {}

    return const [];
  }

  List<_MonitorFloorData> _buildMonitorFloorsFromAdmin(
    List<FloorApiModel> apiFloors,
  ) {
    if (apiFloors.isEmpty) return const [];

    final entries = apiFloors.toList()
      ..sort((a, b) => a.levelNumber.compareTo(b.levelNumber));

    Color itemColor(String itemType) {
      switch (itemType.toUpperCase()) {
        case 'SHIPPING_AREA':
          return const Color(0xFFCFE3B7);
        case 'GOODS_LIFT':
          return const Color(0xFFCDB7EA);
        case 'LIFT':
          return const Color(0xFFBCB9EE);
        case 'VRAC':
          return const Color(0xFFADE3BD);
        case 'RACK_STORAGE':
        case 'FLOOR_STORAGE':
          return const Color(0xFFD6E8EF);
        case 'OFFICE':
        default:
          return const Color(0xFFBAC6D6);
      }
    }

    final monitorFloors = <_MonitorFloorData>[];

    for (final floor in entries) {
      final rows = floor.matrixRows <= 0 ? 10 : floor.matrixRows;
      final cols = floor.matrixColumns <= 0 ? 10 : floor.matrixColumns;
      final cells = List<_MonitorMapCell>.generate(
        rows * cols,
        (_) => const _MonitorMapCell(color: Color(0xFFBAC6D6)),
      );

      for (final item in floor.gridItems) {
        final color = itemColor(item.itemType);
        final startCol = item.x.clamp(0, cols - 1);
        final startRow = item.y.clamp(0, rows - 1);
        final endCol = (item.x + item.width - 1).clamp(0, cols - 1);
        final endRow = (item.y + item.height - 1).clamp(0, rows - 1);

        for (var row = startRow; row <= endRow; row++) {
          for (var col = startCol; col <= endCol; col++) {
            cells[row * cols + col] = _MonitorMapCell(color: color);
          }
        }
      }

      monitorFloors.add(
        _MonitorFloorData(
          level: floor.levelNumber,
          label: floor.levelNumber == 0
              ? 'Ground Floor'
              : 'Floor ${floor.levelNumber}',
          rows: rows,
          columns: cols,
          cells: cells,
        ),
      );
    }

    return monitorFloors;
  }

  List<_MonitorFloorData> _buildMonitorFloors({
    required List<FloorCollection> floors,
    required List<SectionCollection> sections,
    required List<SlotCollection> slots,
    required List<LocationCollection> locations,
  }) {
    bool idMatches(String? value, {required int localId, String? backendId}) {
      if (value == null || value.isEmpty) return false;
      return value == localId.toString() ||
          (backendId != null && value == backendId);
    }

    Color sectionColor(SectionType? sectionType) {
      switch (sectionType) {
        case SectionType.expedition1:
        case SectionType.expedition2:
          return const Color(0xFFCFE3B7);
        case SectionType.monteCharge1:
          return const Color(0xFFCDB7EA);
        case SectionType.monteCharge2:
        case SectionType.elevator:
          return const Color(0xFFBCB9EE);
        case SectionType.paletteSlots:
        case SectionType.picking:
        case SectionType.vrac:
        case SectionType.routeSlots:
        case SectionType.bureau:
        case null:
          return const Color(0xFFBAC6D6);
      }
    }

    final floorEntries = floors.toList()
      ..sort((a, b) => a.levelNumber.compareTo(b.levelNumber));

    if (floorEntries.isEmpty) {
      final fallbackCells = List<_MonitorMapCell>.generate(
        16 * 16,
        (_) => const _MonitorMapCell(color: Color(0xFFEAF1F7)),
      );
      return [
        _MonitorFloorData(
          level: 0,
          label: 'Ground Floor',
          rows: 16,
          columns: 16,
          cells: fallbackCells,
        ),
      ];
    }

    final slotById = <String, SlotCollection>{};
    for (final slot in slots) {
      slotById[slot.id.toString()] = slot;
      if (slot.backendId != null && slot.backendId!.isNotEmpty) {
        slotById[slot.backendId!] = slot;
      }
    }

    final monitorFloors = <_MonitorFloorData>[];

    for (final floor in floorEntries) {
      final rows = floor.matrixRows <= 0 ? 10 : floor.matrixRows;
      final cols = floor.matrixColumns <= 0 ? 10 : floor.matrixColumns;
      final cells = List<_MonitorMapCell>.generate(
        rows * cols,
        (_) => const _MonitorMapCell(color: Color(0xFFBAC6D6)),
      );

      final floorSections = sections.where((section) {
        return idMatches(
          section.floorId,
          localId: floor.id,
          backendId: floor.backendId,
        );
      });

      for (final section in floorSections) {
        final color = sectionColor(section.sectionType);
        final startRow = (section.startRow - 1).clamp(0, rows - 1);
        final endRow = (section.endRow - 1).clamp(0, rows - 1);
        final startCol = (section.startColumn - 1).clamp(0, cols - 1);
        final endCol = (section.endColumn - 1).clamp(0, cols - 1);

        for (var row = startRow; row <= endRow; row++) {
          for (var col = startCol; col <= endCol; col++) {
            cells[row * cols + col] = _MonitorMapCell(color: color);
          }
        }
      }

      final floorLocations = locations.where((location) {
        return idMatches(
          location.floorId,
          localId: floor.id,
          backendId: floor.backendId,
        );
      });

      for (final location in floorLocations) {
        if (location.slotId == null || location.slotId!.isEmpty) continue;
        final slot = slotById[location.slotId!];
        if (slot == null) continue;
        final row = (slot.row - 1).clamp(0, rows - 1);
        final col = (slot.column - 1).clamp(0, cols - 1);
        final index = row * cols + col;

        final color = switch (location.status) {
          LocationStatus.free => const Color(0xFFD6E8EF),
          LocationStatus.assigned => const Color(0xFFF1E9BF),
          LocationStatus.occupied => const Color(0xFFADE3BD),
        };

        cells[index] = _MonitorMapCell(color: color);
      }

      monitorFloors.add(
        _MonitorFloorData(
          level: floor.levelNumber,
          label: floor.levelNumber == 0
              ? 'Ground Floor'
              : 'Floor ${floor.levelNumber}',
          rows: rows,
          columns: cols,
          cells: cells,
        ),
      );
    }

    return monitorFloors;
  }

  String _minutesAgoLabel(DateTime value) {
    final diff = DateTime.now().difference(value);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} mins ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }

  Future<void> _showWarehouseLegend() async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        final entries = [
          (const Color(0xFFEF4444), 'Active Vehicle'),
          (const Color(0xFFA3A3A3), 'Idle Vehicle'),
          (const Color(0xFFD6E8EF), 'Empty Rack Storage'),
          (const Color(0xFFADE3BD), 'Occupied Rack Storage'),
          (const Color(0xFFF1E9BF), 'Assigned Rack Storage'),
          (const Color(0xFFCFE3B7), 'Shipping (Expedition) Area'),
          (const Color(0xFFCDB7EA), 'Goods Lift 1'),
          (const Color(0xFFBCB9EE), 'Goods Lift 2'),
          (const Color(0xFFBAC6D6), 'Other'),
        ];

        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Warehouse Layout Map',
                        style: GoogleFonts.manrope(
                          fontSize: 20 * 0.75,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Color(0xFF94A3B8)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ...entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: entry.$1,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          entry.$2,
                          style: GoogleFonts.manrope(
                            fontSize: 16 * 0.75,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF334155),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _reviewTask(_TaskCardData task) async {
    final result = await _showAIDecisionDialog(task);
    if (result == null) return;

    final isApproved = result.action == _AIDecisionAction.approve;
    final actionLabel = isApproved ? 'Approved' : 'Overridden';
    final overrideNote = isApproved
        ? 'AI_DECISION_APPROVED_BY_SUPERVISOR'
        : (task.type == TaskType.receipt
              ? 'FORECAST_OVERRIDE:${jsonEncode(result.forecastSkuCounts)}'
              : 'LOCATION_OVERRIDE:${result.overrideLocationCode ?? ''}');

    String? syncStatus;
    String? syncNotes;
    String? syncAssigneeField;
    String? syncAssigneeId;

    await _isar.writeTxn(() async {
      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.employeeId = result.employeeId;
          syncAssigneeField = 'employee_id';
          syncAssigneeId = result.employeeId;
          entity.status = BonCommandeStatus.pending;
          entity.notes = _appendSupervisorNote(entity.notes, overrideNote);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.employeeId = result.employeeId;
          syncAssigneeField = 'employee_id';
          syncAssigneeId = result.employeeId;
          entity.status = BonReplenishmentStatus.pending;
          entity.notes = _appendSupervisorNote(entity.notes, overrideNote);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.employeeId = result.employeeId;
          syncAssigneeField = 'employee_id';
          syncAssigneeId = result.employeeId;
          entity.status = BonPickingStatus.pending;
          entity.notes = _appendSupervisorNote(entity.notes, overrideNote);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.employeeId = result.employeeId;
          syncAssigneeField = 'employee_id';
          syncAssigneeId = result.employeeId;
          entity.status = BonLivraisonStatus.idle;
          entity.notes = _appendSupervisorNote(entity.notes, overrideNote);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'IDLE';
          syncNotes = entity.notes;
          await _isar.bonLivraisonCollections.put(entity);
        case _TaskSource.employeeTask:
          final entity = await _isar.employeeTaskCollections.get(task.localId);
          if (entity == null) return;
          entity.assignedToUserId = result.employeeId;
          syncAssigneeField = 'assigned_to_id';
          syncAssigneeId = result.employeeId;
          entity.status = EmployeeTaskStatus.pending;
          entity.notes = _appendSupervisorNote(entity.notes, overrideNote);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.employeeTaskCollections.put(entity);
      }
    });

    await _enqueueTaskSync(
      task,
      action: isApproved ? 'APPROVED' : 'REASSIGNED',
      extra: {
        'status': syncStatus,
        'notes': syncNotes,
        if (syncAssigneeField != null && syncAssigneeId != null)
          syncAssigneeField!: syncAssigneeId,
      },
      priority: 9,
    );

    setState(() {
      _proposedTasks.remove(task);
      _syncProposedPageToFiltered();
    });

    _addHistoryAction(actionLabel, task.code, task.type);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Task ${task.code} $actionLabel and assigned to ${result.employeeName}',
        ),
      ),
    );

    await _triggerSync(showLoader: false);
  }

  Future<void> _approveReport(_TaskCardData task) async {
    if (!task.isEmployeeReport || task.reportLocalId == null) return;

    final user = await _isar.userCollections.where().findFirst();
    final report = await _isar.taskReportCollections.get(task.reportLocalId!);
    if (report == null) return;

    int? approvedGoodQuantity;
    if (_requiresGoodQuantityAdjustment(task)) {
      approvedGoodQuantity = await _showGoodQuantityDialog(task);
      if (approvedGoodQuantity == null) return;
    }

    String? syncStatus;
    String? syncNotes;

    await _isar.writeTxn(() async {
      report.status = TaskReportStatus.resolved;
      report.supervisorId = user?.backendId ?? user?.id.toString();
      report.supervisorName = user?.fullName;
      report.resolvedAt = DateTime.now();
      report.supervisorNotes = task.reportSuggestedSolution;
      report.updatedAt = DateTime.now();
      await _isar.taskReportCollections.put(report);

      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          if (approvedGoodQuantity != null) {
            entity.totalQuantityExpected = approvedGoodQuantity;
            entity.totalQuantityReceived = approvedGoodQuantity;
          }
          entity.status = BonCommandeStatus.inProgress;
          entity.notes = _appendSupervisorNote(
            entity.notes,
            'REPORT_APPROVED:${report.backendId ?? report.id}',
          );
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'IN_PROGRESS';
          syncNotes = entity.notes;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.status = BonReplenishmentStatus.pending;
          entity.notes = _appendSupervisorNote(
            entity.notes,
            'REPORT_APPROVED:${report.backendId ?? report.id}',
          );
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonPickingStatus.pending;
          entity.notes = _appendSupervisorNote(
            entity.notes,
            'REPORT_APPROVED:${report.backendId ?? report.id}',
          );
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonLivraisonStatus.idle;
          entity.notes = _appendSupervisorNote(
            entity.notes,
            'REPORT_APPROVED:${report.backendId ?? report.id}',
          );
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'IDLE';
          syncNotes = entity.notes;
          await _isar.bonLivraisonCollections.put(entity);
        case _TaskSource.employeeTask:
          final entity = await _isar.employeeTaskCollections.get(task.localId);
          if (entity == null) return;
          entity.status = EmployeeTaskStatus.pending;
          entity.notes = _appendSupervisorNote(
            entity.notes,
            'REPORT_APPROVED:${report.backendId ?? report.id}',
          );
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.employeeTaskCollections.put(entity);
      }
    });

    await _enqueueTaskSync(
      task,
      action: 'APPROVED',
      extra: {
        'status': syncStatus,
        'notes': syncNotes,
        if (approvedGoodQuantity != null &&
            task.source == _TaskSource.bonCommande)
          'total_quantity_received': approvedGoodQuantity,
        if (approvedGoodQuantity != null &&
            task.source == _TaskSource.bonCommande)
          'total_quantity_expected': approvedGoodQuantity,
      },
      priority: 9,
    );

    setState(() {
      _reportedTasks.remove(task);
      _syncReportedPageToFiltered();
    });

    _addHistoryAction('Approved', task.code, task.type);

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Report for ${task.code} approved')));

    await _triggerSync(showLoader: false);
  }

  Future<void> _reviewReport(_TaskCardData task) async {
    if (!task.isEmployeeReport || task.reportLocalId == null) return;

    final selection = await _showReportHandlingDialog(task);
    if (selection == null) return;

    if (selection.action == _ReportHandlingAction.deleteTask) {
      final report = await _isar.taskReportCollections.get(task.reportLocalId!);
      if (report != null) {
        await _sendReportHandlingToBackend(report, selection, task);
      }
      await _deleteTask(task);
      return;
    }

    await _applyReportHandling(task, selection);
  }

  List<_ReportHandlingAction> _actionsForTask(_TaskCardData task) {
    switch (task.type) {
      case TaskType.receipt:
        return const [
          _ReportHandlingAction.deleteTask,
          _ReportHandlingAction.setPending,
          _ReportHandlingAction.newReceipt,
        ];
      case TaskType.storage:
      case TaskType.picking:
      case TaskType.delivery:
        return const [
          _ReportHandlingAction.deleteTask,
          _ReportHandlingAction.setPending,
          _ReportHandlingAction.overrideOrder,
        ];
    }
  }

  Future<_ReportHandlingActionSelection?> _showReportHandlingDialog(
    _TaskCardData task,
  ) async {
    final availableActions = _actionsForTask(task);
    var selectedAction = availableActions.first;
    final locationController = TextEditingController();
    final detailsController = TextEditingController();

    return showDialog<_ReportHandlingActionSelection>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Handle Report',
            style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
          ),
          content: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task ${task.code}',
                  style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
                ),
                if (task.issues.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    'Issue: ${task.issues.first}',
                    style: GoogleFonts.manrope(),
                  ),
                ],
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: availableActions
                      .map(
                        (action) => ChoiceChip(
                          label: Text(
                            action.label,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          selected: selectedAction == action,
                          onSelected: (_) {
                            setDialogState(() {
                              selectedAction = action;
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
                if (selectedAction == _ReportHandlingAction.overrideOrder &&
                    (task.type == TaskType.storage ||
                        task.type == TaskType.picking)) ...[
                  const SizedBox(height: 12),
                  TextField(
                    controller: locationController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: task.type == TaskType.storage
                          ? 'Upper-floor location code'
                          : 'Ground-floor location code',
                      hintText: task.type == TaskType.storage
                          ? 'B7-N1-C12'
                          : 'B7-0A-12-34',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
                if (selectedAction == _ReportHandlingAction.newReceipt ||
                    (selectedAction == _ReportHandlingAction.overrideOrder &&
                        task.type == TaskType.delivery)) ...[
                  const SizedBox(height: 12),
                  TextField(
                    controller: detailsController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText:
                          selectedAction == _ReportHandlingAction.newReceipt
                          ? 'New receipt infos'
                          : 'Override infos',
                      hintText:
                          selectedAction == _ReportHandlingAction.newReceipt
                          ? 'Ex: return damaged items, create corrected receipt'
                          : 'Ex: corrected delivery info / notes',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: GoogleFonts.manrope(
                  color: const Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final locationCode = locationController.text
                    .trim()
                    .toUpperCase();
                if (selectedAction == _ReportHandlingAction.overrideOrder &&
                    (task.type == TaskType.storage ||
                        task.type == TaskType.picking) &&
                    locationCode.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Location code is required for override action.',
                      ),
                    ),
                  );
                  return;
                }

                final details = detailsController.text.trim();
                if ((selectedAction == _ReportHandlingAction.newReceipt ||
                        (selectedAction ==
                                _ReportHandlingAction.overrideOrder &&
                            task.type == TaskType.delivery)) &&
                    details.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Provide required informations for this action.',
                      ),
                    ),
                  );
                  return;
                }

                if (selectedAction == _ReportHandlingAction.overrideOrder &&
                    (task.type == TaskType.storage ||
                        task.type == TaskType.picking)) {
                  final normalizedCode = _normalizeLocationCode(locationCode);
                  final overrideCategory = task.type == TaskType.storage
                      ? _OverrideCategory.transfer
                      : _OverrideCategory.picking;
                  final formatError = _locationCodePatternError(
                    normalizedCode,
                    overrideCategory,
                  );
                  if (formatError != null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(formatError)));
                    return;
                  }
                }

                Navigator.pop(
                  context,
                  _ReportHandlingActionSelection(
                    action: selectedAction,
                    locationCode: locationCode.isEmpty ? null : locationCode,
                    details: details.isEmpty ? null : details,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3C91CC),
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Apply',
                style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _applyReportHandling(
    _TaskCardData task,
    _ReportHandlingActionSelection selection,
  ) async {
    if (!task.isEmployeeReport || task.reportLocalId == null) return;

    final user = await _isar.userCollections.where().findFirst();
    final report = await _isar.taskReportCollections.get(task.reportLocalId!);
    if (report == null) return;

    String? syncStatus;
    String? syncNotes;

    await _isar.writeTxn(() async {
      report.status = TaskReportStatus.resolved;
      report.supervisorId = user?.backendId ?? user?.id.toString();
      report.supervisorName = user?.fullName;
      report.resolvedAt = DateTime.now();
      report.supervisorNotes = selection.action.backendAction;
      report.updatedAt = DateTime.now();
      await _isar.taskReportCollections.put(report);

      var marker =
          'REPORT_HANDLED:${selection.action.backendAction}:${report.backendId ?? report.id}';
      if (selection.locationCode != null) {
        marker = '$marker:LOC=${selection.locationCode}';
      }
      if (selection.details != null && selection.details!.trim().isNotEmpty) {
        marker = '$marker:DETAILS=${selection.details!.trim()}';
      }

      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonCommandeStatus.pending;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.status = BonReplenishmentStatus.pending;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonPickingStatus.pending;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonLivraisonStatus.idle;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'IDLE';
          syncNotes = entity.notes;
          await _isar.bonLivraisonCollections.put(entity);
        case _TaskSource.employeeTask:
          final entity = await _isar.employeeTaskCollections.get(task.localId);
          if (entity == null) return;
          entity.status = EmployeeTaskStatus.pending;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncStatus = 'PENDING';
          syncNotes = entity.notes;
          await _isar.employeeTaskCollections.put(entity);
      }
    });

    await _enqueueTaskSync(
      task,
      action: selection.action.syncAction,
      extra: {
        'status': syncStatus,
        'notes': syncNotes,
        if (selection.locationCode != null)
          'location_override': selection.locationCode,
        if (selection.details != null) 'details': selection.details,
      },
      priority: 9,
    );

    await _sendReportHandlingToBackend(report, selection, task);

    setState(() {
      _reportedTasks.remove(task);
      _syncReportedPageToFiltered();
    });

    _addHistoryAction(selection.action.historyLabel, task.code, task.type);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Report for ${task.code} handled (${selection.action.label})',
        ),
      ),
    );

    await _triggerSync(showLoader: false);
  }

  Future<void> _sendReportHandlingToBackend(
    TaskReportCollection report,
    _ReportHandlingActionSelection selection,
    _TaskCardData task,
  ) async {
    if (!_isOnline) return;
    final reportBackendId = report.backendId;
    if (reportBackendId == null || reportBackendId.isEmpty) return;

    try {
      await _apiClient.post(
        '/v1/operations/task-reports/$reportBackendId/handle/',
        data: {
          'action': selection.action.backendAction,
          'notes': 'Handled from supervisor dashboard (${task.code})',
          if (selection.locationCode != null)
            'location_code': selection.locationCode,
          if (selection.details != null) 'details': selection.details,
        },
      );
    } catch (_) {}
  }

  Future<void> _rejectReport(_TaskCardData task) async {
    if (!task.isEmployeeReport || task.reportLocalId == null) return;

    final user = await _isar.userCollections.where().findFirst();
    final report = await _isar.taskReportCollections.get(task.reportLocalId!);
    if (report == null) return;

    String? syncNotes;

    await _isar.writeTxn(() async {
      report.status = TaskReportStatus.resolved;
      report.supervisorId = user?.backendId ?? user?.id.toString();
      report.supervisorName = user?.fullName;
      report.resolvedAt = DateTime.now();
      report.supervisorNotes = 'REPORT_REJECTED_BY_SUPERVISOR';
      report.updatedAt = DateTime.now();
      await _isar.taskReportCollections.put(report);

      final marker = 'REPORT_REJECTED:${report.backendId ?? report.id}';

      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncNotes = entity.notes;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncNotes = entity.notes;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncNotes = entity.notes;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncNotes = entity.notes;
          await _isar.bonLivraisonCollections.put(entity);
        case _TaskSource.employeeTask:
          final entity = await _isar.employeeTaskCollections.get(task.localId);
          if (entity == null) return;
          entity.notes = _appendSupervisorNote(entity.notes, marker);
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          syncNotes = entity.notes;
          await _isar.employeeTaskCollections.put(entity);
      }
    });

    await _enqueueTaskSync(
      task,
      action: 'REJECTED',
      extra: {'notes': syncNotes},
      priority: 9,
    );

    setState(() {
      _reportedTasks.remove(task);
      _syncReportedPageToFiltered();
    });

    _addHistoryAction('Rejected', task.code, task.type);

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Report for ${task.code} rejected')));

    await _triggerSync(showLoader: false);
  }

  Future<int?> _showGoodQuantityDialog(_TaskCardData task) async {
    final controller = TextEditingController(text: task.skuCount.toString());

    return showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Validate Good Quantity',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Good quantity to store',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          style: GoogleFonts.manrope(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: GoogleFonts.manrope(
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final parsed = int.tryParse(controller.text.trim());
              if (parsed == null || parsed < 0 || parsed > task.skuCount) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Enter a value between 0 and ${task.skuCount}',
                    ),
                  ),
                );
                return;
              }
              Navigator.pop(context, parsed);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3C91CC),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Save',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Future<_AIDecisionReviewResult?> _showAIDecisionDialog(
    _TaskCardData task,
  ) async {
    final assignmentOptions = await _loadEmployeeAssignmentOptions(task);

    if (assignmentOptions.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No employees available for assignment.'),
          ),
        );
      }
      return null;
    }

    final skus = await _isar.sKUCollections.where().findAll();

    final selectedForecast = <String, int>{};
    final locationController = TextEditingController();
    _AIDecisionAction selectedAction = _AIDecisionAction.approve;

    String selectedEmployeeId = assignmentOptions.first.id;

    return showDialog<_AIDecisionReviewResult>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          final isForecastTask = task.type == TaskType.receipt;
          if (selectedEmployeeId.isEmpty) {
            selectedEmployeeId = assignmentOptions.first.id;
          }
          final overrideCategory = _overrideCategoryForTask(task.type);

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Review AI Decision',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
            ),
            content: SizedBox(
              width: 420,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task ${task.code}',
                      style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedEmployeeId,
                      decoration: InputDecoration(
                        labelText: 'Assign Employee',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: assignmentOptions
                          .map(
                            (candidate) => DropdownMenuItem<String>(
                              value: candidate.id,
                              child: Text(
                                candidate.name,
                                style: GoogleFonts.manrope(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        setDialogState(() {
                          selectedEmployeeId = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    ChoiceChip(
                      label: const Text('Override'),
                      selected: selectedAction == _AIDecisionAction.override,
                      onSelected: (selected) {
                        setDialogState(() {
                          selectedAction = selected
                              ? _AIDecisionAction.override
                              : _AIDecisionAction.approve;
                        });
                      },
                    ),
                    if (selectedAction == _AIDecisionAction.override) ...[
                      const SizedBox(height: 8),
                      Text(
                        '${overrideCategory.label} Override',
                        style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      if (isForecastTask) ...[
                        Text(
                          'Select products and set quantities',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          constraints: const BoxConstraints(maxHeight: 220),
                          child: ListView(
                            shrinkWrap: true,
                            children: skus.take(12).map((sku) {
                              final key = sku.backendId ?? sku.skuCode;
                              final isSelected = selectedForecast.containsKey(
                                key,
                              );
                              final qty = selectedForecast[key] ?? 1;
                              return Row(
                                children: [
                                  Checkbox(
                                    value: isSelected,
                                    onChanged: (checked) {
                                      setDialogState(() {
                                        if (checked == true) {
                                          selectedForecast[key] = 1;
                                        } else {
                                          selectedForecast.remove(key);
                                        }
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${sku.skuCode} - ${sku.name}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(fontSize: 12),
                                    ),
                                  ),
                                  if (isSelected)
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setDialogState(() {
                                              selectedForecast[key] = math.max(
                                                1,
                                                qty - 1,
                                              );
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            size: 18,
                                          ),
                                        ),
                                        Text(
                                          '$qty',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setDialogState(() {
                                              selectedForecast[key] = qty + 1;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ] else ...[
                        TextField(
                          controller: locationController,
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                            labelText:
                                overrideCategory == _OverrideCategory.transfer
                                ? 'Upper-Floor Location Code'
                                : 'Ground-Floor Location Code',
                            hintText:
                                overrideCategory == _OverrideCategory.transfer
                                ? 'B7-N1-C12'
                                : 'B7-0A-12-34',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.manrope(
                    color: const Color(0xFF64748B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final selectedEmployee = assignmentOptions.firstWhere(
                    (candidate) => candidate.id == selectedEmployeeId,
                    orElse: () => assignmentOptions.first,
                  );

                  String? overrideLocationCode;
                  Map<String, int> forecastPayload = const {};

                  if (selectedAction == _AIDecisionAction.override) {
                    if (task.type == TaskType.receipt) {
                      if (selectedForecast.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Select at least one product and count.',
                            ),
                          ),
                        );
                        return;
                      }
                      forecastPayload = Map<String, int>.from(selectedForecast);
                    } else {
                      final enteredCode = locationController.text
                          .trim()
                          .toUpperCase();
                      if (enteredCode.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter a location code.'),
                          ),
                        );
                        return;
                      }

                      final normalizedCode = _normalizeLocationCode(
                        enteredCode,
                      );
                      final formatError = _locationCodePatternError(
                        normalizedCode,
                        overrideCategory,
                      );
                      if (formatError != null) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(formatError)));
                        return;
                      }

                      final location = await _findLocationByNormalizedCode(
                        normalizedCode,
                      );

                      if (location == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Location $enteredCode not found. Sync locations and try again.',
                            ),
                          ),
                        );
                        return;
                      }

                      final available = location.status == LocationStatus.free;
                      if (!available) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Location ${location.code} is occupied/assigned. Choose a free one.',
                            ),
                          ),
                        );
                        return;
                      }

                      overrideLocationCode = location.code;
                    }
                  }

                  if (!mounted) return;
                  Navigator.pop(
                    context,
                    _AIDecisionReviewResult(
                      action: selectedAction,
                      employeeId: selectedEmployee.id,
                      employeeName: selectedEmployee.name,
                      overrideLocationCode: overrideLocationCode,
                      forecastSkuCounts: forecastPayload,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3C91CC),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  selectedAction == _AIDecisionAction.approve
                      ? 'Approve + Assign'
                      : 'Override + Assign',
                  style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<List<_EmployeeAssignmentOption>> _loadEmployeeAssignmentOptions(
    _TaskCardData task,
  ) async {
    final optionsById = <String, _EmployeeAssignmentOption>{};
    final nameById = <String, String>{};

    void addOption(String? id, {String? name}) {
      final normalizedId = (id ?? '').trim();
      if (normalizedId.isEmpty) return;
      final resolvedName = (name ?? '').trim().isNotEmpty
          ? name!.trim()
          : (nameById[normalizedId] ?? 'Employee');
      optionsById.putIfAbsent(
        normalizedId,
        () => _EmployeeAssignmentOption(id: normalizedId, name: resolvedName),
      );
    }

    final employees = await _isar.userCollections
        .filter()
        .roleEqualTo(UserRole.employee)
        .findAll();

    for (final employee in employees) {
      final localId = employee.id.toString();
      final backendId = (employee.backendId ?? '').trim();
      if (employee.fullName.trim().isNotEmpty) {
        nameById[localId] = employee.fullName.trim();
        if (backendId.isNotEmpty) {
          nameById[backendId] = employee.fullName.trim();
        }
      }
      addOption(employee.backendId, name: employee.fullName);
    }

    if (optionsById.isNotEmpty) {
      return optionsById.values.toList();
    }

    switch (task.source) {
      case _TaskSource.bonCommande:
        final entity = await _isar.bonCommandeCollections.get(task.localId);
        addOption(entity?.employeeId);
      case _TaskSource.bonReplenishment:
        final entity = await _isar.bonReplenishmentCollections.get(
          task.localId,
        );
        addOption(entity?.employeeId);
      case _TaskSource.bonPicking:
        final entity = await _isar.bonPickingCollections.get(task.localId);
        addOption(entity?.employeeId);
      case _TaskSource.bonLivraison:
        final entity = await _isar.bonLivraisonCollections.get(task.localId);
        addOption(entity?.employeeId);
      case _TaskSource.employeeTask:
        final entity = await _isar.employeeTaskCollections.get(task.localId);
        addOption(entity?.assignedToUserId);
    }

    if (optionsById.isNotEmpty) {
      return optionsById.values.toList();
    }

    final employeeTasks = await _isar.employeeTaskCollections.where().findAll();
    for (final employeeTask in employeeTasks) {
      addOption(employeeTask.assignedToUserId);
    }

    final commandes = await _isar.bonCommandeCollections.where().findAll();
    for (final commande in commandes) {
      addOption(commande.employeeId);
    }

    final replenishments = await _isar.bonReplenishmentCollections
        .where()
        .findAll();
    for (final replenishment in replenishments) {
      addOption(replenishment.employeeId);
    }

    final pickings = await _isar.bonPickingCollections.where().findAll();
    for (final picking in pickings) {
      addOption(picking.employeeId);
    }

    final livraisons = await _isar.bonLivraisonCollections.where().findAll();
    for (final livraison in livraisons) {
      addOption(livraison.employeeId);
    }

    return optionsById.values.toList();
  }

  _OverrideCategory _overrideCategoryForTask(TaskType taskType) {
    switch (taskType) {
      case TaskType.receipt:
        return _OverrideCategory.forecasting;
      case TaskType.storage:
        return _OverrideCategory.transfer;
      case TaskType.picking:
        return _OverrideCategory.picking;
      case TaskType.delivery:
        return _OverrideCategory.transfer;
    }
  }

  String _normalizeLocationCode(String value) {
    return value.toUpperCase().replaceAll('-', '').replaceAll(' ', '');
  }

  String? _locationCodePatternError(
    String normalizedCode,
    _OverrideCategory category,
  ) {
    if (category == _OverrideCategory.forecasting) {
      return null;
    }

    if (category == _OverrideCategory.transfer) {
      final transferRegex = RegExp(r'^B7N[1-4]C[0-9]+$');
      if (!transferRegex.hasMatch(normalizedCode)) {
        return 'Transfer code format must be B7-NZ-CW (Z=1..4, W=integer), e.g. B7-N2-C15.';
      }
      return null;
    }

    if (category == _OverrideCategory.picking) {
      final pickRegex = RegExp(r'^B70A[0-9]{4}$');
      if (!pickRegex.hasMatch(normalizedCode)) {
        return 'Pick code format must be B7-0A-XX-YY (X,Y=0..9), e.g. B7-0A-12-34.';
      }
      return null;
    }

    return null;
  }

  Future<LocationCollection?> _findLocationByNormalizedCode(
    String normalizedCode,
  ) async {
    final direct = await _isar.locationCollections
        .filter()
        .codeEqualTo(normalizedCode)
        .findFirst();
    if (direct != null) return direct;

    final allLocations = await _isar.locationCollections.where().findAll();
    for (final location in allLocations) {
      if (_normalizeLocationCode(location.code) == normalizedCode) {
        return location;
      }
    }

    return null;
  }

  String _appendSupervisorNote(String? notes, String marker) {
    final current = (notes ?? '').trim();
    if (current.isEmpty) return marker;
    return '$current\n$marker';
  }
}

enum _AIDecisionAction { approve, override }

enum _ReportHandlingAction { deleteTask, setPending, newReceipt, overrideOrder }

extension _ReportHandlingActionUI on _ReportHandlingAction {
  String get label {
    switch (this) {
      case _ReportHandlingAction.deleteTask:
        return 'Delete';
      case _ReportHandlingAction.setPending:
        return 'Set Pending';
      case _ReportHandlingAction.newReceipt:
        return 'New Receipt';
      case _ReportHandlingAction.overrideOrder:
        return 'Override';
    }
  }

  String get backendAction {
    switch (this) {
      case _ReportHandlingAction.deleteTask:
        return 'DELETE_TASK';
      case _ReportHandlingAction.setPending:
        return 'SET_PENDING';
      case _ReportHandlingAction.newReceipt:
        return 'NEW_RECEIPT';
      case _ReportHandlingAction.overrideOrder:
        return 'OVERRIDE_ORDER';
    }
  }

  String get syncAction {
    switch (this) {
      case _ReportHandlingAction.deleteTask:
        return 'DELETED';
      case _ReportHandlingAction.setPending:
        return 'SET_PENDING';
      case _ReportHandlingAction.newReceipt:
        return 'NEW_RECEIPT';
      case _ReportHandlingAction.overrideOrder:
        return 'OVERRIDDEN';
    }
  }

  String get historyLabel {
    switch (this) {
      case _ReportHandlingAction.deleteTask:
        return 'Deleted';
      case _ReportHandlingAction.setPending:
        return 'Pending';
      case _ReportHandlingAction.newReceipt:
        return 'New Receipt';
      case _ReportHandlingAction.overrideOrder:
        return 'Overridden';
    }
  }
}

enum _OverrideCategory { forecasting, transfer, picking }

extension _OverrideCategoryLabel on _OverrideCategory {
  String get label {
    switch (this) {
      case _OverrideCategory.forecasting:
        return 'Forecast';
      case _OverrideCategory.transfer:
        return 'Transfer';
      case _OverrideCategory.picking:
        return 'Pick';
    }
  }
}

enum _ReportReviewDecision { accept, reject }

class _ReportHandlingActionSelection {
  const _ReportHandlingActionSelection({
    required this.action,
    this.locationCode,
    this.details,
  });

  final _ReportHandlingAction action;
  final String? locationCode;
  final String? details;
}

class _AIDecisionReviewResult {
  const _AIDecisionReviewResult({
    required this.action,
    required this.employeeId,
    required this.employeeName,
    required this.forecastSkuCounts,
    this.overrideLocationCode,
  });

  final _AIDecisionAction action;
  final String employeeId;
  final String employeeName;
  final String? overrideLocationCode;
  final Map<String, int> forecastSkuCounts;
}

class _EmployeeAssignmentOption {
  const _EmployeeAssignmentOption({required this.id, required this.name});

  final String id;
  final String name;
}

enum MonitorOrderFilter { all, pending, inProgress, complete, reported }

extension MonitorOrderFilterUI on MonitorOrderFilter {
  String get label {
    switch (this) {
      case MonitorOrderFilter.all:
        return 'All';
      case MonitorOrderFilter.pending:
        return 'Pending';
      case MonitorOrderFilter.inProgress:
        return 'In Progress';
      case MonitorOrderFilter.complete:
        return 'Complete';
      case MonitorOrderFilter.reported:
        return 'Reported';
    }
  }
}

enum MonitorOrderStatus { pending, inProgress, complete, reported }

extension MonitorOrderStatusUI on MonitorOrderStatus {
  Color get color {
    switch (this) {
      case MonitorOrderStatus.pending:
        return const Color(0xFFF59E0B);
      case MonitorOrderStatus.inProgress:
        return const Color(0xFF00C2EB);
      case MonitorOrderStatus.complete:
        return const Color(0xFF22C55E);
      case MonitorOrderStatus.reported:
        return const Color(0xFFEF4444);
    }
  }
}

class _MonitorDataBundle {
  const _MonitorDataBundle({
    required this.floors,
    required this.chariots,
    required this.orders,
    this.activeWarehouseName,
  });

  final List<_MonitorFloorData> floors;
  final List<_MonitorChariotData> chariots;
  final List<_MonitorOrderData> orders;
  final String? activeWarehouseName;

  String get activeWarehouseLabel {
    final value = activeWarehouseName?.trim();
    if (value == null || value.isEmpty) return 'Unknown Warehouse';
    return value;
  }
}

class _MonitorFloorData {
  const _MonitorFloorData({
    required this.level,
    required this.label,
    required this.rows,
    required this.columns,
    required this.cells,
  });

  final int level;
  final String label;
  final int rows;
  final int columns;
  final List<_MonitorMapCell> cells;
}

class _MonitorMapCell {
  const _MonitorMapCell({required this.color});

  final Color color;
}

class _GridPoint {
  const _GridPoint({required this.row, required this.column});

  final int row;
  final int column;
}

class _MonitorPathPainter extends CustomPainter {
  const _MonitorPathPainter({
    required this.path,
    required this.rows,
    required this.columns,
  });

  final List<_GridPoint> path;
  final int rows;
  final int columns;

  @override
  void paint(Canvas canvas, Size size) {
    if (path.length < 2) return;

    final paint = Paint()
      ..color = const Color(0xFFEF4444)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final cellWidth = size.width / columns;
    final cellHeight = size.height / rows;

    final p = Path();
    final first = path.first;
    p.moveTo((first.column - 0.5) * cellWidth, (first.row - 0.5) * cellHeight);

    for (final point in path.skip(1)) {
      p.lineTo(
        (point.column - 0.5) * cellWidth,
        (point.row - 0.5) * cellHeight,
      );
    }

    canvas.drawPath(p, paint);
  }

  @override
  bool shouldRepaint(covariant _MonitorPathPainter oldDelegate) {
    return oldDelegate.path != path ||
        oldDelegate.rows != rows ||
        oldDelegate.columns != columns;
  }
}

class _MonitorChariotData {
  const _MonitorChariotData({
    required this.code,
    required this.active,
    required this.floorLevel,
    required this.row,
    required this.column,
    required this.employeeName,
    required this.transferId,
    required this.locationLabel,
    required this.startedAt,
    required this.lastKnownPosition,
    required this.path,
    this.debugReferenceId,
    this.debugOperationType,
    this.debugRouteNodeCount,
    this.debugDataSource,
  });

  final String code;
  final bool active;
  final int floorLevel;
  final int row;
  final int column;
  final String employeeName;
  final String transferId;
  final String locationLabel;
  final DateTime? startedAt;
  final String lastKnownPosition;
  final List<_GridPoint> path;
  final String? debugReferenceId;
  final String? debugOperationType;
  final int? debugRouteNodeCount;
  final String? debugDataSource;
}

class _MonitorProductLine {
  const _MonitorProductLine({required this.product, required this.quantity});

  final String product;
  final int quantity;
}

class _MonitorOrderData {
  const _MonitorOrderData({
    required this.id,
    required this.title,
    required this.displayId,
    this.warehouseName,
    required this.employeeName,
    required this.status,
    required this.products,
    required this.floorLevel,
    required this.row,
    required this.column,
    required this.locationLabel,
    required this.lastKnownPosition,
    required this.icon,
    required this.referenceId,
    this.routeNodes = const [],
  });

  final String id;
  final String title;
  final String displayId;
  final String? warehouseName;
  final String employeeName;
  final MonitorOrderStatus status;
  final List<_MonitorProductLine> products;
  final int floorLevel;
  final int? row;
  final int? column;
  final String locationLabel;
  final String lastKnownPosition;
  final IconData icon;
  final String referenceId;
  final List<String> routeNodes;

  String get warehouseLabel {
    final value = warehouseName?.trim();
    if (value == null || value.isEmpty) return 'Unknown Warehouse';
    return value;
  }
}

class _MonitorResolvedLocation {
  const _MonitorResolvedLocation({
    required this.floorLevel,
    required this.locationLabel,
    required this.lastKnownPosition,
    this.row,
    this.column,
  });

  final int floorLevel;
  final int? row;
  final int? column;
  final String locationLabel;
  final String lastKnownPosition;
}

class _MonitorLocationResolver {
  _MonitorLocationResolver({
    required List<FloorCollection> floors,
    required List<SlotCollection> slots,
    required List<LocationCollection> locations,
    required List<ZoneCollection> zones,
  }) {
    for (final floor in floors) {
      _floorByKey[floor.id.toString()] = floor;
      if (floor.backendId != null && floor.backendId!.isNotEmpty) {
        _floorByKey[floor.backendId!] = floor;
      }
    }

    for (final slot in slots) {
      _slotByKey[slot.id.toString()] = slot;
      if (slot.backendId != null && slot.backendId!.isNotEmpty) {
        _slotByKey[slot.backendId!] = slot;
      }
    }

    for (final location in locations) {
      _locationByKey[location.id.toString()] = location;
      if (location.backendId != null && location.backendId!.isNotEmpty) {
        _locationByKey[location.backendId!] = location;
      }
      _locationByCode[_normalizeCode(location.code)] = location;
    }

    for (final zone in zones) {
      _zoneByKey[zone.id.toString()] = zone;
      if (zone.backendId != null && zone.backendId!.isNotEmpty) {
        _zoneByKey[zone.backendId!] = zone;
      }
    }
  }

  final Map<String, FloorCollection> _floorByKey = {};
  final Map<String, SlotCollection> _slotByKey = {};
  final Map<String, LocationCollection> _locationByKey = {};
  final Map<String, ZoneCollection> _zoneByKey = {};
  final Map<String, LocationCollection> _locationByCode = {};

  _MonitorResolvedLocation resolve(Iterable<String> locationRefs) {
    for (final ref in locationRefs) {
      final normalizedRef = ref.trim();
      if (normalizedRef.isEmpty) continue;

      final location =
          _locationByKey[normalizedRef] ??
          _locationByCode[_normalizeCode(normalizedRef)];
      if (location == null) continue;

      final floor = location.floorId == null
          ? null
          : _floorByKey[location.floorId!];
      final zone = _zoneByKey[location.zoneId];
      final slot = location.slotId == null
          ? null
          : _slotByKey[location.slotId!];

      final floorLevel = floor?.levelNumber ?? 0;
      final floorLabel = floorLevel == 0 ? 'Ground Floor' : 'Floor $floorLevel';
      final zoneLabel = zone?.name ?? 'Zone #Num';

      return _MonitorResolvedLocation(
        floorLevel: floorLevel,
        row: slot?.row,
        column: slot?.column,
        locationLabel: '$floorLabel, $zoneLabel',
        lastKnownPosition: zoneLabel,
      );
    }

    return const _MonitorResolvedLocation(
      floorLevel: 0,
      locationLabel: 'Unknown location',
      lastKnownPosition: 'Unknown',
    );
  }

  _GridPoint? resolveRouteNodeToPoint({
    required String node,
    required int floorLevel,
    required int rows,
    required int columns,
  }) {
    final value = node.trim();
    if (value.isEmpty) return null;

    final upper = value.toUpperCase();

    if (upper == 'RDC_NODE' || upper == 'RDC') {
      if (floorLevel != 0) return null;
      return _GridPoint(row: 2.clamp(1, rows), column: 2.clamp(1, columns));
    }

    if (upper == 'EXP_NODE' || upper.startsWith('EXP')) {
      if (floorLevel != 0) return null;
      return _GridPoint(
        row: (rows - 1).clamp(1, rows),
        column: (columns - 1).clamp(1, columns),
      );
    }

    if (upper.startsWith('ELEV_F')) {
      final level = int.tryParse(upper.replaceFirst('ELEV_F', ''));
      if (level == null || level != floorLevel) return null;
      return _GridPoint(
        row: 2.clamp(1, rows),
        column: (columns - 2).clamp(1, columns),
      );
    }

    final direct = _locationByKey[value];
    final byCode = _locationByCode[_normalizeCode(value)];
    final location = direct ?? byCode;
    if (location != null) {
      final floor = location.floorId == null
          ? null
          : _floorByKey[location.floorId!];
      final locationFloor = floor?.levelNumber ?? 0;
      if (locationFloor == floorLevel) {
        if (location.slotId != null && location.slotId!.isNotEmpty) {
          final slot = _slotByKey[location.slotId!];
          if (slot != null) {
            return _GridPoint(
              row: slot.row.clamp(1, rows),
              column: slot.column.clamp(1, columns),
            );
          }
        }
      }
    }

    // Fallback: Parse location code format (e.g., "MON-WH-GF-R07-C06")
    final rowMatch = RegExp(r'-R(\d+)', caseSensitive: false).firstMatch(upper);
    final colMatch = RegExp(r'-C(\d+)', caseSensitive: false).firstMatch(upper);
    final floorMatch = RegExp(r'-(GF|SF\d+)', caseSensitive: false).firstMatch(upper);

    if (rowMatch != null && colMatch != null) {
      final parsedRow = int.tryParse(rowMatch.group(1)!);
      final parsedCol = int.tryParse(colMatch.group(1)!);

      if (parsedRow != null && parsedCol != null) {
        // Check floor level matches
        if (floorMatch != null) {
          final floorCode = floorMatch.group(1)!.toUpperCase();
          int parsedFloor;
          if (floorCode == 'GF') {
            parsedFloor = 0;
          } else if (floorCode.startsWith('SF')) {
            parsedFloor = int.tryParse(floorCode.substring(2)) ?? -1;
          } else {
            parsedFloor = -1;
          }

          if (parsedFloor != floorLevel) return null;
        }

        return _GridPoint(
          row: parsedRow.clamp(1, rows),
          column: parsedCol.clamp(1, columns),
        );
      }
    }

    return null;
  }

  String _normalizeCode(String value) {
    return value.toUpperCase().replaceAll('-', '').replaceAll(' ', '');
  }
}

class _SupervisorTaskCard extends StatelessWidget {
  const _SupervisorTaskCard({
    required this.data,
    this.showReviewButton = false,
    this.compact = false,
    this.overrideColor,
    this.onDelete,
    this.onReassign,
    this.onReview,
  });

  final _TaskCardData data;
  final bool showReviewButton;
  final bool compact;
  final Color? overrideColor;
  final VoidCallback? onDelete;
  final VoidCallback? onReassign;
  final VoidCallback? onReview;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final typeColor = overrideColor ?? data.type.color;
    final isReviewAction = showReviewButton || data.isEmployeeReport;

    if (compact) {
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
              ),
              child: Row(
                children: [
                  Icon(data.type.icon, size: 16, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${data.type.label} - ${data.code}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.issues.isNotEmpty
                          ? 'Issue: ${data.issues.first}'
                          : '${data.zoneOrSlotLabel}: ${data.zoneOrSlotValue}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    if (data.reportSuggestedSolution != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        'Solution: ${data.reportSuggestedSolution}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                    const Spacer(),
                    if (data.isEmployeeReport)
                      SizedBox(
                        width: double.infinity,
                        height: 34,
                        child: ElevatedButton(
                          onPressed: onReview,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: typeColor,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Review',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    else
                      Row(
                        children: [
                          if (onDelete != null) ...[
                            SizedBox(
                              width: 34,
                              height: 34,
                              child: OutlinedButton(
                                onPressed: onDelete,
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  side: const BorderSide(
                                    color: Colors.red,
                                    width: 1.6,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.delete_outline,
                                  size: 18,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Expanded(
                            child: SizedBox(
                              height: 34,
                              child: ElevatedButton(
                                onPressed: showReviewButton
                                    ? onReview
                                    : onReassign,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: typeColor,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  showReviewButton ? 'Review' : 'Re-Assign',
                                  style: GoogleFonts.manrope(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

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
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(data.type.icon, size: 20, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.type.label} Order - ${data.code}',
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      if (data.issues.isNotEmpty)
                        Text(
                          'Issue: ${data.issues.first}',
                          style: GoogleFonts.manrope(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                    ],
                  ),
                ),
                if (!showReviewButton && !data.isEmployeeReport)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Proposed By AI',
                      style: GoogleFonts.manrope(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
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
                        if (data.skuCount > 0) ...[
                          const SizedBox(height: 8),
                          _InfoRow(label: '📦', value: '${data.skuCount} SKUs'),
                        ],
                      ],
                    ),
                  ),
                  if (data.issues.isEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 80,
                        height: 80,
                        color: const Color(0xFFE2E8F0),
                        child: const Icon(
                          Icons.image_outlined,
                          size: 32,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isReviewAction ? onReview : onReassign,
                style: ElevatedButton.styleFrom(
                  backgroundColor: typeColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isReviewAction ? 'Review' : 'Re-Assign',
                      style: GoogleFonts.manrope(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      isReviewAction
                          ? Icons.arrow_forward_rounded
                          : Icons.replay_outlined,
                      size: 18,
                    ),
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

class _DonutChartPainter extends CustomPainter {
  _DonutChartPainter({
    required this.receiptCount,
    required this.transferCount,
    required this.pickingCount,
    required this.totalTasks,
  });

  final int receiptCount;
  final int transferCount;
  final int pickingCount;
  final int totalTasks;

  @override
  void paint(Canvas canvas, Size size) {
    if (totalTasks == 0) return;

    final strokeWidth = 28.0;
    final center = Offset(size.width / 2, size.height - strokeWidth / 2);
    final radius = math.min(size.width / 2, size.height - strokeWidth / 2);

    const totalSweep = math.pi;
    final receiptAngle = (receiptCount / totalTasks) * totalSweep;
    final transferAngle = (transferCount / totalTasks) * totalSweep;
    final pickingAngle = (pickingCount / totalTasks) * totalSweep;

    var startAngle = math.pi;

    // Receipt section
    if (receiptCount > 0) {
      final paint = Paint()
        ..color = const Color(0xFF3C91CC)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        receiptAngle,
        false,
        paint,
      );
      startAngle += receiptAngle;
    }

    // Transfer section
    if (transferCount > 0) {
      final paint = Paint()
        ..color = const Color(0xFF7B67BF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        transferAngle,
        false,
        paint,
      );
      startAngle += transferAngle;
    }

    // Picking section
    if (pickingCount > 0) {
      final paint = Paint()
        ..color = const Color(0xFF006D84)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        pickingAngle,
        false,
        paint,
      );
      startAngle += pickingAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _HistoryAction {
  const _HistoryAction({
    required this.action,
    required this.taskCode,
    required this.type,
    required this.timestamp,
  });

  final String action;
  final String taskCode;
  final TaskType type;
  final DateTime timestamp;
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.action});

  final _HistoryAction action;

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);

    if (diff.inMinutes < 1) {
      // Show hour:minute instead of "just now"
      final hour = dt.hour.toString().padLeft(2, '0');
      final minute = dt.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context) {
    final color = action.type.color;
    final actionColor = _actionColor(action.action);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(action.type.icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  action.taskCode,
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  action.action,
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: actionColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${action.type.label} Order',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          Text(
            _formatTime(action.timestamp),
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Color _actionColor(String actionLabel) {
    final normalized = actionLabel.toLowerCase();
    if (normalized == 'approved') return Colors.green;
    if (normalized == 'rejected') return Colors.red;
    if (normalized == 'deleted') return Colors.red;
    return const Color(0xFF64748B);
  }
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
    required this.issues,
    this.isEmployeeReport = false,
    this.reportLocalId,
    this.reportSuggestedSolution,
    this.reportDescription,
    this.reportedByName,
    this.backendId,
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
  final List<String> issues;
  final bool isEmployeeReport;
  final int? reportLocalId;
  final String? reportSuggestedSolution;
  final String? reportDescription;
  final String? reportedByName;
}

enum _TaskSource {
  bonCommande,
  bonReplenishment,
  bonPicking,
  bonLivraison,
  employeeTask,
}

enum TaskType { receipt, storage, picking, delivery }

extension TaskTypeUI on TaskType {
  String get label {
    switch (this) {
      case TaskType.receipt:
        return 'Forecast';
      case TaskType.storage:
        return 'Transfer';
      case TaskType.picking:
        return 'Pick';
      case TaskType.delivery:
        return 'Transfer';
    }
  }

  Color get color {
    switch (this) {
      case TaskType.receipt:
        return const Color(0xFF3C91CC);
      case TaskType.storage:
        return const Color(0xFF7B67BF);
      case TaskType.picking:
        return const Color(0xFF006D84);
      case TaskType.delivery:
        return const Color(0xFF71B643);
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
    }
  }
}

enum TaskTypeFilter { reports, aiProposed }

enum ProposedTaskFilter { forecast, transfer, pick }

extension ProposedTaskFilterUI on ProposedTaskFilter {
  String get label {
    switch (this) {
      case ProposedTaskFilter.forecast:
        return 'Forecast';
      case ProposedTaskFilter.transfer:
        return 'Transfer';
      case ProposedTaskFilter.pick:
        return 'Pick';
    }
  }

  String get description {
    switch (this) {
      case ProposedTaskFilter.forecast:
        return 'Forecast: predict products and their quantities that will be sold tomorrow.';
      case ProposedTaskFilter.transfer:
        return 'Transfer: provide storage slot codes in upper floors only.';
      case ProposedTaskFilter.pick:
        return 'Pick: provide rack slot codes in ground floor only.';
    }
  }

  Color get color {
    switch (this) {
      case ProposedTaskFilter.forecast:
        return const Color(0xFF3C91CC);
      case ProposedTaskFilter.transfer:
        return const Color(0xFF7B67BF);
      case ProposedTaskFilter.pick:
        return const Color(0xFF006D84);
    }
  }

  bool matches(TaskType taskType) {
    switch (this) {
      case ProposedTaskFilter.forecast:
        return taskType == TaskType.receipt;
      case ProposedTaskFilter.transfer:
        return taskType == TaskType.storage || taskType == TaskType.delivery;
      case ProposedTaskFilter.pick:
        return taskType == TaskType.picking;
    }
  }
}

extension TaskTypeFilterUI on TaskTypeFilter {
  String get label {
    switch (this) {
      case TaskTypeFilter.reports:
        return 'Reports';
      case TaskTypeFilter.aiProposed:
        return 'AI Proposed Tasks';
    }
  }

  Color get color {
    switch (this) {
      case TaskTypeFilter.reports:
        return const Color(0xFFF97316);
      case TaskTypeFilter.aiProposed:
        return const Color(0xFF3C91CC);
    }
  }

  bool matches(_TaskCardData task) {
    switch (this) {
      case TaskTypeFilter.reports:
        return task.isEmployeeReport;
      case TaskTypeFilter.aiProposed:
        return !task.isEmployeeReport;
    }
  }
}

enum ReportIssueFilter { all, receipt, storage, picking, delivery }

extension ReportIssueFilterUI on ReportIssueFilter {
  String get label {
    switch (this) {
      case ReportIssueFilter.all:
        return 'All';
      case ReportIssueFilter.receipt:
        return 'Receipt';
      case ReportIssueFilter.storage:
        return 'Storage';
      case ReportIssueFilter.picking:
        return 'Picking';
      case ReportIssueFilter.delivery:
        return 'Delivery';
    }
  }

  Color get color {
    switch (this) {
      case ReportIssueFilter.all:
        return const Color(0xFF0F172A);
      case ReportIssueFilter.receipt:
        return const Color(0xFF3C91CC);
      case ReportIssueFilter.storage:
        return const Color(0xFF7B67BF);
      case ReportIssueFilter.picking:
        return const Color(0xFF006D84);
      case ReportIssueFilter.delivery:
        return const Color(0xFF71B643);
    }
  }

  bool matches(_TaskCardData task) {
    switch (this) {
      case ReportIssueFilter.all:
        return true;
      case ReportIssueFilter.receipt:
        return task.type == TaskType.receipt;
      case ReportIssueFilter.storage:
        return task.type == TaskType.storage;
      case ReportIssueFilter.picking:
        return task.type == TaskType.picking;
      case ReportIssueFilter.delivery:
        return task.type == TaskType.delivery;
    }
  }
}
