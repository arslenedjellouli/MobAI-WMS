import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import 'package:mobile_ai/config/di/injection_container.dart';
import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_commande_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_livraison_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_replenishment_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_metadata_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_queue_collection.dart';
import 'package:mobile_ai/core/network/network_service.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';
import 'package:mobile_ai/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_ai/shared/widgets/app_bottom_bar.dart';

class SupervisorDashboardPage extends StatefulWidget {
  const SupervisorDashboardPage({super.key});

  @override
  State<SupervisorDashboardPage> createState() =>
      _SupervisorDashboardPageState();
}

class _SupervisorDashboardPageState extends State<SupervisorDashboardPage> {
  final Isar _isar = sl<IsarDatabase>().isar;
  final SyncService _syncService = sl<SyncService>();
  final ConnectivityService _connectivityService = sl<ConnectivityService>();
  final Uuid _uuid = const Uuid();

  AppBottomTab _currentView = AppBottomTab.home;
  TaskTypeFilter _selectedFilter = TaskTypeFilter.receipt;
  TaskTypeFilter _searchFilter = TaskTypeFilter.receipt;
  bool _isLoading = true;
  bool _isSyncing = false;

  String _supervisorName = 'Supervisor';
  String _supervisorId = '-';
  bool _isOnline = false;
  String _lastSync = 'Never';
  final TextEditingController _searchController = TextEditingController();

  final List<_TaskCardData> _reportedTasks = [];
  final List<_TaskCardData> _proposedTasks = [];
  final List<_HistoryAction> _historyActions = [];

  int _receiptCount = 0;
  int _storageCount = 0;
  int _pickingCount = 0;
  int _deliveryCount = 0;

  StreamSubscription<NetworkStatus>? _networkSub;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  @override
  void dispose() {
    _networkSub?.cancel();
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

    if (_isOnline) {
      await _triggerSync(showLoader: false);
    }
  }

  Future<void> _loadDashboardData() async {
    final user = await _isar.userCollections.where().findFirst();

    final syncMeta = await _isar.syncMetadataCollections
        .filter()
        .entityTypeEqualTo('GLOBAL')
        .findFirst();

    final commandes = await _isar.bonCommandeCollections.where().findAll();
    final replenish = await _isar.bonReplenishmentCollections.where().findAll();
    final picking = await _isar.bonPickingCollections.where().findAll();
    final livraison = await _isar.bonLivraisonCollections.where().findAll();

    final reported = <_TaskCardData>[];
    final proposed = <_TaskCardData>[];

    int receiptCount = 0;
    int storageCount = 0;
    int pickingCount = 0;
    int deliveryCount = 0;

    for (final item in commandes) {
      receiptCount++;
      final task = _taskFromCommande(item);
      // Check if notes contain "ISSUE_REPORTED" for reported tasks
      if (item.notes != null && item.notes!.contains('ISSUE_REPORTED')) {
        reported.add(task);
      } else if (item.status == BonCommandeStatus.pending) {
        proposed.add(task);
      }
    }

    for (final item in replenish) {
      storageCount++;
      final task = _taskFromReplenishment(item);
      if (item.notes != null && item.notes!.contains('ISSUE_REPORTED')) {
        reported.add(task);
      } else if (item.status == BonReplenishmentStatus.pending) {
        proposed.add(task);
      }
    }

    for (final item in picking) {
      pickingCount++;
      final task = _taskFromPicking(item);
      if (item.notes != null && item.notes!.contains('ISSUE_REPORTED')) {
        reported.add(task);
      } else if (item.status == BonPickingStatus.pending) {
        proposed.add(task);
      }
    }

    for (final item in livraison) {
      deliveryCount++;
      final task = _taskFromLivraison(item);
      if (item.notes != null && item.notes!.contains('ISSUE_REPORTED')) {
        reported.add(task);
      } else if (item.status == BonLivraisonStatus.idle) {
        proposed.add(task);
      }
    }

    reported.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    proposed.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (!mounted) return;
    setState(() {
      _supervisorName = user?.fullName ?? 'Supervisor';
      _supervisorId = user?.backendId ?? (user?.id.toString() ?? '-');
      _lastSync = _formatSyncDate(syncMeta?.lastPullAt ?? syncMeta?.lastPushAt);

      _reportedTasks
        ..clear()
        ..addAll(reported);

      _proposedTasks
        ..clear()
        ..addAll(proposed);

      _receiptCount = receiptCount;
      _storageCount = storageCount;
      _pickingCount = pickingCount;
      _deliveryCount = deliveryCount;

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
    await _isar.writeTxn(() async {
      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonCommandeStatus.pending;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.status = BonReplenishmentStatus.pending;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonPickingStatus.pending;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.status = BonLivraisonStatus.idle;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonLivraisonCollections.put(entity);
      }
    });

    await _enqueueTaskSync(task, action: 'REASSIGNED', priority: 9);

    setState(() {
      _reportedTasks.remove(task);
      _proposedTasks.insert(0, task);
    });

    _addHistoryAction('Re-Assigned', task.code, task.type);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task ${task.code} reassigned successfully')),
    );

    await _triggerSync(showLoader: false);
  }

  List<_TaskCardData> get _filteredProposedTasks {
    return _proposedTasks
        .where((task) => task.type == _selectedFilter.toTaskType())
        .toList();
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
    final totalTasks = _receiptCount + _storageCount + _pickingCount + _deliveryCount;

    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF1F5F9),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    Widget body;
    switch (_currentView) {
      case AppBottomTab.home:
        body = RefreshIndicator(
          onRefresh: () => _triggerSync(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(textTheme),
                const SizedBox(height: 24),
                _buildDonutChart(totalTasks),
                const SizedBox(height: 32),
                _buildHandleReports(textTheme),
                const SizedBox(height: 32),
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
        body = Center(
          child: Text(
            'Monitor section under development',
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF64748B),
            ),
          ),
        );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      bottomNavigationBar: AppBottomBar(
        currentTab: _currentView,
        onTabSelected: _handleBottomTab,
      ),
      body: SafeArea(child: body),
    );
  }

  Widget _buildSearchView(TextTheme textTheme) {
    final allTasks = [..._reportedTasks, ..._proposedTasks];
    final filteredTasks = allTasks
        .where((task) =>
            (_searchController.text.isEmpty ||
                task.code
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase())) &&
            task.type == _searchFilter.toTaskType())
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TaskTypeFilter.values.map((filter) {
                    final isSelected = _searchFilter == filter;
                    final color = filter.color;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
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
                              color: isSelected ? Colors.white : const Color(0xFF64748B),
                            ),
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
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _SupervisorTaskCard(
                        data: task,
                        showReviewButton: _proposedTasks.contains(task),
                        onReassign: _reportedTasks.contains(task)
                            ? () => _reassignTask(task)
                            : null,
                        onReview: _proposedTasks.contains(task)
                            ? () => _reviewTask(task)
                            : null,
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
                  onPressed: _isOnline && !_isSyncing ? _triggerSync : null,
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
                    color: _isOnline ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  _isOnline ? 'Online' : 'Offline',
                  style: GoogleFonts.manrope(
                    textStyle: textTheme.bodySmall,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF64748B),
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
                storageCount: _storageCount,
                pickingCount: _pickingCount,
                deliveryCount: _deliveryCount,
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
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    '${_proposedTasks.length} Proposals | ${_reportedTasks.length} Overrides',
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
        if (_reportedTasks.isEmpty)
          _buildEmptyState(textTheme, 'No reported issues.')
        else
          ..._reportedTasks.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _SupervisorTaskCard(
                data: task,
                onReassign: () => _reassignTask(task),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildReviewProposedTasks(TextTheme textTheme) {
    final filteredTasks = _filteredProposedTasks;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review Proposed Tasks',
          style: GoogleFonts.manrope(
            textStyle: textTheme.titleLarge,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 16),
        _buildFilterButtons(),
        const SizedBox(height: 16),
        if (filteredTasks.isEmpty)
          _buildEmptyState(textTheme, 'No proposed tasks.')
        else
          ...filteredTasks.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _SupervisorTaskCard(
                data: task,
                showReviewButton: true,
                onReview: () => _reviewTask(task),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFilterButtons() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: TaskTypeFilter.values.map((filter) {
        final isSelected = _selectedFilter == filter;
        final color = filter.color;

        return InkWell(
          onTap: () => setState(() => _selectedFilter = filter),
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
                color: isSelected ? Colors.white : const Color(0xFF64748B),
              ),
            ),
          ),
        );
      }).toList(),
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

  Future<void> _reviewTask(_TaskCardData task) async {
    final result = await _showReviewDialog(task);
    if (result == null) return;

    await _isar.writeTxn(() async {
      switch (task.source) {
        case _TaskSource.bonCommande:
          final entity = await _isar.bonCommandeCollections.get(task.localId);
          if (entity == null) return;
          entity.status = result == 'approve'
              ? BonCommandeStatus.pending
              : BonCommandeStatus.completed;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonCommandeCollections.put(entity);
        case _TaskSource.bonReplenishment:
          final entity = await _isar.bonReplenishmentCollections.get(
            task.localId,
          );
          if (entity == null) return;
          entity.status = result == 'approve'
              ? BonReplenishmentStatus.pending
              : BonReplenishmentStatus.cancelled;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonReplenishmentCollections.put(entity);
        case _TaskSource.bonPicking:
          final entity = await _isar.bonPickingCollections.get(task.localId);
          if (entity == null) return;
          entity.status = result == 'approve'
              ? BonPickingStatus.pending
              : BonPickingStatus.cancelled;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonPickingCollections.put(entity);
        case _TaskSource.bonLivraison:
          final entity = await _isar.bonLivraisonCollections.get(task.localId);
          if (entity == null) return;
          entity.status = result == 'approve'
              ? BonLivraisonStatus.idle
              : BonLivraisonStatus.failed;
          entity.updatedAt = DateTime.now();
          entity.syncStatus = false;
          await _isar.bonLivraisonCollections.put(entity);
      }
    });

    await _enqueueTaskSync(
      task,
      action: result == 'approve' ? 'APPROVED' : 'REJECTED',
      priority: 9,
    );

    setState(() {
      _proposedTasks.remove(task);
    });

    _addHistoryAction(
      result == 'approve' ? 'Approved' : 'Rejected',
      task.code,
      task.type,
    );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Task ${task.code} ${result == 'approve' ? 'approved' : 'rejected'}',
        ),
      ),
    );

    await _triggerSync(showLoader: false);
  }

  Future<String?> _showReviewDialog(_TaskCardData task) async {
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Review Task',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
        content: Text(
          'Do you want to approve or reject task ${task.code}?',
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
          TextButton(
            onPressed: () => Navigator.pop(context, 'reject'),
            child: Text(
              'Reject',
              style: GoogleFonts.manrope(
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, 'approve'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3C91CC),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Approve',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _SupervisorTaskCard extends StatelessWidget {
  const _SupervisorTaskCard({
    required this.data,
    this.showReviewButton = false,
    this.onReassign,
    this.onReview,
  });

  final _TaskCardData data;
  final bool showReviewButton;
  final VoidCallback? onReassign;
  final VoidCallback? onReview;

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
                  child: Icon(
                    data.type.icon,
                    size: 20,
                    color: Colors.white,
                  ),
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
                if (!showReviewButton)
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: showReviewButton ? onReview : onReassign,
                style: ElevatedButton.styleFrom(
                  backgroundColor: typeColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      showReviewButton ? 'Review' : 'Re-Assign',
                      style: GoogleFonts.manrope(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      showReviewButton
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
    required this.storageCount,
    required this.pickingCount,
    required this.deliveryCount,
    required this.totalTasks,
  });

  final int receiptCount;
  final int storageCount;
  final int pickingCount;
  final int deliveryCount;
  final int totalTasks;

  @override
  void paint(Canvas canvas, Size size) {
    if (totalTasks == 0) return;

    final strokeWidth = 28.0;
    final center = Offset(size.width / 2, size.height - strokeWidth / 2);
    final radius = math.min(size.width / 2, size.height - strokeWidth / 2);

    const totalSweep = math.pi;
    final receiptAngle = (receiptCount / totalTasks) * totalSweep;
    final storageAngle = (storageCount / totalTasks) * totalSweep;
    final pickingAngle = (pickingCount / totalTasks) * totalSweep;
    final deliveryAngle = (deliveryCount / totalTasks) * totalSweep;

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

    // Storage section
    if (storageCount > 0) {
      final paint = Paint()
        ..color = const Color(0xFF7B67BF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        storageAngle,
        false,
        paint,
      );
      startAngle += storageAngle;
    }

    // Picking section
    if (pickingCount > 0) {
      final paint = Paint()
        ..color = const Color(0xFFFE8C21)
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

    // Delivery section
    if (deliveryCount > 0) {
      final paint = Paint()
        ..color = const Color(0xFF71B643)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        deliveryAngle,
        false,
        paint,
      );
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

    if (diff.inMinutes < 1) return 'just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context) {
    final color = action.type.color;

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
            child: Icon(
              action.type.icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${action.action} - ${action.taskCode}',
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
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
}

enum _TaskSource { bonCommande, bonReplenishment, bonPicking, bonLivraison }

enum TaskType { receipt, storage, picking, delivery }

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

enum TaskTypeFilter { receipt, storage, picking, delivery }

extension TaskTypeFilterUI on TaskTypeFilter {
  String get label {
    switch (this) {
      case TaskTypeFilter.receipt:
        return 'Receipt';
      case TaskTypeFilter.storage:
        return 'Storage';
      case TaskTypeFilter.picking:
        return 'Picking';
      case TaskTypeFilter.delivery:
        return 'Delivery';
    }
  }

  Color get color {
    switch (this) {
      case TaskTypeFilter.receipt:
        return const Color(0xFF3C91CC);
      case TaskTypeFilter.storage:
        return const Color(0xFF7B67BF);
      case TaskTypeFilter.picking:
        return const Color(0xFFFE8C21);
      case TaskTypeFilter.delivery:
        return const Color(0xFF71B643);
    }
  }

  TaskType toTaskType() {
    switch (this) {
      case TaskTypeFilter.receipt:
        return TaskType.receipt;
      case TaskTypeFilter.storage:
        return TaskType.storage;
      case TaskTypeFilter.picking:
        return TaskType.picking;
      case TaskTypeFilter.delivery:
        return TaskType.delivery;
    }
  }
}
