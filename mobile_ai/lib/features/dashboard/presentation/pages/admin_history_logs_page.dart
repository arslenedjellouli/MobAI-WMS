import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mobile_ai/config/di/injection_container.dart';
import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'package:isar/isar.dart';
import 'package:mobile_ai/core/database/models/auth/user_session_collection.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/database/models/operations/employee_task_collection.dart';
import 'package:mobile_ai/core/database/models/operations/task_report_collection.dart';
import 'package:mobile_ai/core/database/models/ai/ai_decision_collection.dart';
import 'package:mobile_ai/core/database/models/ai/ai_override_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_preparation_collection.dart';

enum LogRoleFilter {
  all('All'),
  employee('Employee'),
  aiAgent('AI Agent'),
  supervisor('Supervisor'),
  admin('ADMIN');

  final String label;
  const LogRoleFilter(this.label);
}

class AdminHistoryLogsPage extends StatefulWidget {
  const AdminHistoryLogsPage({super.key});

  @override
  State<AdminHistoryLogsPage> createState() => _AdminHistoryLogsPageState();
}

class _AdminHistoryLogsPageState extends State<AdminHistoryLogsPage> {
  final Isar _isar = sl<IsarDatabase>().isar;
  final SyncService _syncService = sl<SyncService>();
  
  LogRoleFilter _selectedFilter = LogRoleFilter.all;
  
  // Track which log sections are expanded
  final Set<String> _expandedSections = {};
  
  bool _isLoading = true;
  bool _isSyncing = false;
  
  // Fetched data
  List<UserSessionCollection> _loginSessions = [];
  List<EmployeeTaskCollection> _completedTasks = [];
  List<TaskReportCollection> _reports = [];
  List<AIDecisionCollection> _aiDecisions = [];
  List<AIOverrideCollection> _aiOverrides = [];
  List<BonPickingCollection> _pickingOrders = [];
  Map<String, UserCollection> _usersCache = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Sync data from backend
      await _syncService.pullChanges();
      
      // Load login/logout sessions (most recent 50)
      _loginSessions = await _isar.userSessionCollections
          .where()
          .sortByLoginTimeDesc()
          .limit(50)
          .findAll();
      
      // Load completed tasks
      _completedTasks = await _isar.employeeTaskCollections
          .filter()
          .statusEqualTo(EmployeeTaskStatus.completed)
          .sortByCompletedAtDesc()
          .limit(50)
          .findAll();
      
      // Load reports
      _reports = await _isar.taskReportCollections
          .where()
          .sortByReportedAtDesc()
          .limit(50)
          .findAll();
      
      // Load AI decisions
      _aiDecisions = await _isar.aIDecisionCollections
          .where()
          .sortByCreatedAtDesc()
          .limit(50)
          .findAll();
      
      // Load AI overrides
      _aiOverrides = await _isar.aIOverrideCollections
          .where()
          .sortByCreatedAtDesc()
          .limit(50)
          .findAll();
      
      // Load picking orders
      _pickingOrders = await _isar.bonPickingCollections
          .filter()
          .statusEqualTo(BonPickingStatus.completed)
          .sortByCompletedAtDesc()
          .limit(50)
          .findAll();
      
      // Cache users for display
      final allUserIds = <String>{
        ..._loginSessions.map((s) => s.userId),
        ..._completedTasks.map((t) => t.assignedToUserId),
        ..._reports.where((r) => r.reportedById != null).map((r) => r.reportedById!),
        ..._aiOverrides.map((o) => o.overriddenByUserId),
      };
      
      final users = await _isar.userCollections
          .filter()
          .anyOf(allUserIds.toList(), (q, id) => q.backendIdEqualTo(id))
          .findAll();
      
      _usersCache = {for (var u in users) if (u.backendId != null) u.backendId!: u};
      
    } catch (e) {
      debugPrint('Error loading logs: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _refreshData() async {
    if (_isSyncing) return;

    setState(() {
      _isSyncing = true;
    });

    try {
      await _syncService.pushChanges();
      await _syncService.pullChanges();
      await _loadData();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sync failed: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSyncing = false;
        });
      }
    }
  }

  void _toggleSection(String sectionId) {
    setState(() {
      if (_expandedSections.contains(sectionId)) {
        _expandedSections.remove(sectionId);
      } else {
        _expandedSections.add(sectionId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'History And Logs',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'History And Logs',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_isSyncing)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh, color: Color(0xFF1E293B)),
              onPressed: _refreshData,
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: LogRoleFilter.values.map((filter) {
                    final isSelected = _selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(28),
                        onTap: () {
                          setState(() {
                            _selectedFilter = filter;
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
              const SizedBox(height: 24),
              
              // Content
              _buildLogsList(),
            ],
          ),
        ),
      ),
    );
  }

  bool _shouldShowSection(String sectionType) {
    // Define which sections are visible for each role
    switch (_selectedFilter) {
      case LogRoleFilter.employee:
        return ['login', 'logout', 'order-done', 'order-reported'].contains(sectionType);
      case LogRoleFilter.aiAgent:
        return ['storage-route', 'picking-route', 'predicted-prep'].contains(sectionType);
      case LogRoleFilter.supervisor:
      case LogRoleFilter.admin:
        return ['login', 'logout', 'validated-ai', 'override-ai', 'deleted-report', 'pending-report', 'override-task'].contains(sectionType);
      case LogRoleFilter.all:
        return true; // Show all sections
    }
  }

  Widget _buildLogsList() {
    final showCommandCards = _selectedFilter == LogRoleFilter.all || _selectedFilter == LogRoleFilter.employee;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Command Order Card Section
        if (showCommandCards)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Command Order Card',
              style: GoogleFonts.inter(
                fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1E293B),
                ),
              ),
            ),
          
          if (showCommandCards)
            _buildCommandCard(
              commandId: '#CMD-001',
              warehouse: 'Warehouse A',
              date: '15/02/2026',
              time: '15:00 PM',
              assignedWorker: 'Worker-123',
              products: [
                {'product': 'SKU 1', 'quantity': '1000'},
                {'product': 'SKU 1', 'quantity': '1000'},
                {'product': 'SKU 1', 'quantity': '1000'},
                {'product': 'SKU 1', 'quantity': '1000'},
              ],
              sectionId: 'command-card-${_selectedFilter.label}',
            ),
          
          if (showCommandCards)
            const SizedBox(height: 24),

          // Command Orders Header
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Command Orders',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),

          // Authentication Logs
          if (_shouldShowSection('login'))
            _buildLogSection(
              icon: Icons.login,
              title: 'Log In',
              subtitle: 'Username - Role',
              color: Colors.green,
              sectionId: 'login-${_selectedFilter.label}',
              details: _buildLoginDetails(),
            ),
          
          if (_shouldShowSection('logout'))
            _buildLogSection(
              icon: Icons.logout,
              title: 'Log Out',
              subtitle: 'Username - Role',
              color: Colors.red,
              sectionId: 'logout-${_selectedFilter.label}',
              details: _buildLogoutDetails(),
            ),

          // Order Status Logs
          if (_shouldShowSection('order-done'))
            _buildLogSection(
              icon: Icons.check_circle_outline,
              title: 'Order Done - #ID',
              subtitle: '',
              color: Colors.green,
              sectionId: 'order-done-${_selectedFilter.label}',
              details: _buildOrderDoneDetails(),
            ),

          if (_shouldShowSection('order-reported'))
            _buildLogSection(
              icon: Icons.report_problem_outlined,
              title: 'Order Reported - #ID',
              subtitle: '',
              color: Colors.red,
              sectionId: 'order-reported-${_selectedFilter.label}',
              details: _buildOrderReportedDetails(),
            ),

          // Route Logs
          if (_shouldShowSection('storage-route'))
            _buildLogSection(
              icon: Icons.location_on_outlined,
              title: 'Storage Location and Transfer Route',
              subtitle: '',
              color: const Color(0xFF00796B),
              sectionId: 'storage-route-${_selectedFilter.label}',
              details: _buildStorageRouteDetails(),
            ),

          if (_shouldShowSection('picking-route'))
            _buildLogSection(
              icon: Icons.shopping_cart_outlined,
              title: 'Picking Location and Route',
              subtitle: '',
              color: const Color(0xFF00796B),
              sectionId: 'picking-route-${_selectedFilter.label}',
              details: _buildPickingRouteDetails(),
            ),

          // AI Decision Logs
          if (_shouldShowSection('predicted-prep'))
            _buildLogSection(
              icon: Icons.insights_outlined,
              title: 'Predicted Preparation Products',
              subtitle: '',
              color: const Color(0xFF00796B),
              sectionId: 'predicted-prep-${_selectedFilter.label}',
              details: _buildPredictedPrepDetails(),
            ),

          if (_shouldShowSection('validated-ai'))
            _buildLogSection(
              icon: Icons.check_circle,
              title: 'Validated AI Decision',
              subtitle: '',
              color: Colors.green,
              sectionId: 'validated-ai-${_selectedFilter.label}',
              details: _buildValidatedAIDetails(),
            ),

          if (_shouldShowSection('override-ai'))
            _buildLogSection(
              icon: Icons.edit_outlined,
              title: 'Override AI Decision',
              subtitle: '',
              color: const Color(0xFF00796B),
              sectionId: 'override-ai-${_selectedFilter.label}',
              details: _buildOverrideAIDetails(),
            ),

          // Report Management Logs
          if (_shouldShowSection('deleted-report'))
            _buildLogSection(
              icon: Icons.delete_outline,
              title: 'Deleted a report',
              subtitle: '',
              color: Colors.red,
              sectionId: 'deleted-report-${_selectedFilter.label}',
              details: _buildDeletedReportDetails(),
            ),

          if (_shouldShowSection('pending-report'))
            _buildLogSection(
              icon: Icons.pending_outlined,
              title: 'Set a Report as Pending',
              subtitle: '',
              color: Colors.orange,
              sectionId: 'pending-report-${_selectedFilter.label}',
              details: _buildPendingReportDetails(),
            ),

          if (_shouldShowSection('override-task'))
            _buildLogSection(
              icon: Icons.task_alt_outlined,
              title: 'Override a Reported Task',
              subtitle: '',
              color: const Color(0xFF00796B),
              sectionId: 'override-task-${_selectedFilter.label}',
              details: _buildOverrideTaskDetails(),
            ),
      ],
    );
  }

  Widget _buildLogSection({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required String sectionId,
    required Widget details,
  }) {
    final isExpanded = _expandedSections.contains(sectionId);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => _toggleSection(sectionId),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: color, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1E293B),
                            ),
                          ),
                          if (subtitle.isNotEmpty)
                            Text(
                              subtitle,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: const Color(0xFF64748B),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: const Color(0xFF64748B),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isExpanded)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
                ),
              ),
              child: details,
            ),
        ],
      ),
    );
  }

  // Detail Widgets for each log type
  Widget _buildLoginDetails() {
    if (_loginSessions.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No login records found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _loginSessions.take(5).map((session) {
        final user = _usersCache[session.userId];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Username', user?.email ?? session.userId),
              _buildDetailRow('Role', user?.role.name.toUpperCase() ?? 'Unknown'),
              _buildDetailRow('Timestamp', _formatDateTime(session.loginTime)),
              _buildDetailRow('Device', session.deviceInfo ?? 'Unknown'),
              if (session.ipAddress != null)
                _buildDetailRow('IP Address', session.ipAddress!),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLogoutDetails() {
    final logoutSessions = _loginSessions.where((s) => s.logoutTime != null).toList();
    
    if (logoutSessions.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No logout records found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: logoutSessions.take(5).map((session) {
        final user = _usersCache[session.userId];
        final duration = session.logoutTime!.difference(session.loginTime);
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Username', user?.email ?? session.userId),
              _buildDetailRow('Role', user?.role.name.toUpperCase() ?? 'Unknown'),
              _buildDetailRow('Session Duration', _formatDuration(duration)),
              _buildDetailRow('Timestamp', _formatDateTime(session.logoutTime!)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOrderDoneDetails() {
    if (_completedTasks.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No completed orders found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _completedTasks.take(5).map((task) {
        final user = _usersCache[task.assignedToUserId];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Task Type', task.taskType.name.toUpperCase()),
              const SizedBox(height: 4),
              _buildDetailRow('Employee', user?.fullName ?? 'Unknown'),
              _buildDetailRow('Title', task.title),
              if (task.description != null)
                _buildDetailRow('Description', task.description!),
              _buildDetailRow('Completed', _formatDateTime(task.completedAt!)),
              _buildDetailRow('Items Completed', '${task.itemsCompleted}/${task.itemsCount}'),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOrderReportedDetails() {
    final reportedTasks = _reports.where((r) => r.status == TaskReportStatus.pending).toList();
    
    if (reportedTasks.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No reported problems found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reportedTasks.take(5).map((report) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Reported Problem: ${report.issues.join(", ")}',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFDC2626),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildDetailRow('Task', report.taskTitle ?? 'Unknown'),
              _buildDetailRow('Reported By', report.reportedByName ?? 'Unknown'),
              if (report.description != null)
                _buildDetailRow('Description', report.description!),
              _buildDetailRow('Reported At', _formatDateTime(report.reportedAt)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStorageRouteDetails() {
    final storageTasks = _completedTasks.where((t) => 
      t.taskType == EmployeeTaskType.storage).toList();
    
    if (storageTasks.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No storage routes found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: storageTasks.take(5).map((task) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Task', task.title),
              _buildDetailRow('Employee', _usersCache[task.assignedToUserId]?.fullName ?? 'Unknown'),
              if (task.description != null)
                _buildDetailRow('Details', task.description!),
              _buildDetailRow('Completed', _formatDateTime(task.completedAt!)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPickingRouteDetails() {
    if (_pickingOrders.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No picking routes found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _pickingOrders.take(5).map((picking) {
        final user = _usersCache[picking.employeeId];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Employee', user?.fullName ?? 'Unknown'),
              if (picking.totalDistance != null)
                _buildDetailRow('Distance', '${picking.totalDistance!.toStringAsFixed(2)}m'),
              if (picking.estimatedDuration != null)
                _buildDetailRow('Duration', '${(picking.estimatedDuration! / 60).toStringAsFixed(1)} min'),
              _buildDetailRow('Status', picking.status.name.toUpperCase()),
              _buildDetailRow('Completed', _formatDateTime(picking.completedAt!)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPredictedPrepDetails() {
    final prepDecisions = _aiDecisions.where((d) => 
      d.decisionType == AIDecisionType.preparationGeneration).toList();
    
    if (prepDecisions.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No preparation predictions found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: prepDecisions.take(5).map((decision) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Confidence', '${(decision.confidenceScore * 100).toStringAsFixed(1)}%'),
              _buildDetailRow('Status', decision.status.name.toUpperCase()),
              _buildDetailRow('Created', _formatDateTime(decision.createdAt)),
              if (decision.validatedAt != null)
                _buildDetailRow('Validated', _formatDateTime(decision.validatedAt!)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildValidatedAIDetails() {
    final validatedDecisions = _aiDecisions.where((d) => 
      d.status == AIDecisionStatus.validated).toList();
    
    if (validatedDecisions.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No validated AI decisions found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: validatedDecisions.take(5).map((decision) {
        final validator = decision.validatedByUserId != null 
          ? _usersCache[decision.validatedByUserId!] 
          : null;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Decision Type', decision.decisionType.name.toUpperCase()),
              _buildDetailRow('Confidence', '${(decision.confidenceScore * 100).toStringAsFixed(1)}%'),
              _buildDetailRow('Validated By', validator?.fullName ?? 'Unknown'),
              _buildDetailRow('Validated At', _formatDateTime(decision.validatedAt!)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOverrideAIDetails() {
    if (_aiOverrides.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No AI overrides found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _aiOverrides.take(5).map((override) {
        final supervisor = _usersCache[override.overriddenByUserId];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Overridden By', supervisor?.fullName ?? 'Unknown'),
              _buildDetailRow('Justification', override.justification),
              _buildDetailRow('Created', _formatDateTime(override.createdAt)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDeletedReportDetails() {
    final deletedReports = _reports.where((r) => 
      r.status == TaskReportStatus.resolved).toList();
    
    if (deletedReports.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No deleted reports found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: deletedReports.take(5).map((report) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Task', report.taskTitle ?? 'Unknown'),
              _buildDetailRow('Reported By', report.reportedByName ?? 'Unknown'),
              if (report.supervisorNotes != null)
                _buildDetailRow('Rejection Note', report.supervisorNotes!),
              _buildDetailRow('Resolved At', _formatDateTime(report.resolvedAt ?? report.updatedAt)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPendingReportDetails() {
    final pendingReports = _reports.where((r) => 
      r.status == TaskReportStatus.pending).toList();
    
    if (pendingReports.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No pending reports found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: pendingReports.take(5).map((report) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Task', report.taskTitle ?? 'Unknown'),
              _buildDetailRow('Issues', report.issues.join(', ')),
              _buildDetailRow('Reported By', report.reportedByName ?? 'Unknown'),
              _buildDetailRow('Reported At', _formatDateTime(report.reportedAt)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOverrideTaskDetails() {
    final overrideTasks = _completedTasks.where((t) => 
      t.notes != null && t.notes!.toLowerCase().contains('override')).toList();
    
    if (overrideTasks.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No task overrides found', style: TextStyle(color: Color(0xFF64748B))),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: overrideTasks.take(5).map((task) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Task Type', task.taskType.name.toUpperCase()),
              _buildDetailRow('Task', task.title),
              if (task.notes != null)
                _buildDetailRow('Override Info', task.notes!),
              _buildDetailRow('Completed', _formatDateTime(task.completedAt!)),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildProductTable(List<Map<String, String>> products) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Product',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Quantity',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Rows
          ...products.asMap().entries.map((entry) {
            final index = entry.key;
            final product = entry.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: index < products.length - 1
                    ? const Border(
                        bottom: BorderSide(color: Color(0xFFE2E8F0)),
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      product['product'] ?? '',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      product['quantity'] ?? '',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool bold = false,
    bool isIndented = false,
    TextStyle? style,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8,
        left: isIndented ? 16 : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Expanded(
              flex: 2,
              child: Text(
                '$label:',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: bold ? FontWeight.w600 : FontWeight.w500,
                  color: const Color(0xFF64748B),
                ),
              ),
            ),
          if (label.isNotEmpty)
            const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: style ?? GoogleFonts.inter(
                fontSize: 13,
                fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommandCard({
    required String commandId,
    required String warehouse,
    required String date,
    required String time,
    required String assignedWorker,
    required List<Map<String, String>> products,
    required String sectionId,
  }) {
    final isExpanded = _expandedSections.contains(sectionId);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => _toggleSection(sectionId),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Command - $commandId',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.edit_outlined, size: 18, color: const Color(0xFF00796B)),
                          const SizedBox(width: 8),
                          Icon(Icons.delete_outline, size: 18, color: const Color(0xFFDC2626)),
                        ],
                      ),
                    ],
                  ),
                  if (!isExpanded) ...[
                    const SizedBox(height: 12),
                    Text(
                      'Warehouse: $warehouse',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Date: $date',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Time: $time',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Assigned Worker: $assignedWorker',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.expand_more, size: 16, color: const Color(0xFF64748B)),
                        const SizedBox(width: 4),
                        Text(
                          'Show Order Details',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (isExpanded)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Warehouse', warehouse),
                  const SizedBox(height: 4),
                  _buildDetailRow('Date', date),
                  const SizedBox(height: 4),
                  _buildDetailRow('Time', time),
                  const SizedBox(height: 4),
                  _buildDetailRow('Assigned Worker', assignedWorker),
                  const SizedBox(height: 16),
                  _buildProductTable(products),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.expand_less, size: 16, color: const Color(0xFF64748B)),
                      const SizedBox(width: 4),
                      Text(
                        'Less Details',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
  
  // Helper methods for formatting
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }
  
  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }
}
