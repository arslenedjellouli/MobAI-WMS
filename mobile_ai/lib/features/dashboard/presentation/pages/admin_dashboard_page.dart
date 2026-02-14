import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'dart:async';

import 'package:mobile_ai/config/di/injection_container.dart';
import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_metadata_collection.dart';
import 'package:mobile_ai/core/network/network_service.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';
import 'package:mobile_ai/features/dashboard/presentation/pages/admin_history_logs_page.dart';
import 'package:mobile_ai/core/database/models/ai/ai_decision_collection.dart';
import 'package:mobile_ai/core/database/models/ai/sku_forecast_collection.dart';

class AdminDashboardPage extends StatefulWidget {
class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
    // AI metrics
    double _validatedPercent = 0.0;
    double _overriddenPercent = 0.0;
    double _avgConfidence = 0.0;
    double _avgAccuracy = 0.0;
  final Isar _isar = sl<IsarDatabase>().isar;
  final SyncService _syncService = sl<SyncService>();
  final ConnectivityService _connectivityService = sl<ConnectivityService>();
  final NetworkService _networkService = sl<NetworkService>();

  bool _isLoading = true;
  bool _isSyncing = false;
  bool _isOnline = false;
  String _adminName = 'Admin';
  String _lastSync = 'Never';
  
  StreamSubscription<NetworkStatus>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _bootstrap();
    _listenToConnectivity();
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  void _listenToConnectivity() {
    _connectivitySubscription = _connectivityService.networkStatusStream.listen((status) {
      if (mounted) {
        setState(() {
          _isOnline = status == NetworkStatus.online;
        });
      }
    });
  }

  Future<void> _bootstrap() async {
    _isOnline = _connectivityService.isOnline;
    
    // Load user info
    final user = await _isar.userCollections.where().findFirst();
    if (user != null) {
      setState(() {
        _adminName = user.fullName.split(' ').first;
      });
    }

    // Load last sync
    await _loadSyncMetadata();

    // Load AI metrics
    await _loadAIMetrics();

    setState(() {
      _isLoading = false;
    });

    // Trigger sync if online
    if (_isOnline && mounted) {
      await _triggerSync();
    }
  }

  Future<void> _loadSyncMetadata() async {
    final metadata = await _isar.syncMetadataCollections
        .filter()
        .entityTypeEqualTo('GLOBAL')
        .findFirst();

    if (metadata?.lastPullAt != null && mounted) {
      setState(() {
        _lastSync = _formatSyncDate(metadata!.lastPullAt!);
      });
    }
  }

  String _formatSyncDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) return 'now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  Future<void> _triggerSync() async {
    if (_isSyncing) return;

    setState(() {
      _isSyncing = true;
    });

    try {
      await _syncService.pushChanges();
      await _syncService.pullChanges();
      await _loadSyncMetadata();
      await _loadAIMetrics();
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

  Future<void> _loadAIMetrics() async {
    // Order Decisions: validated vs overridden
    final decisions = await _isar.aIDecisionCollections.where().findAll();
    final total = decisions.length;
    final validated = decisions.where((d) => d.status == AIDecisionStatus.validated).length;
    final overridden = decisions.where((d) => d.status == AIDecisionStatus.overridden).length;
    _validatedPercent = total > 0 ? validated / total : 0.0;
    _overriddenPercent = total > 0 ? overridden / total : 0.0;
    _avgConfidence = total > 0 ? decisions.map((d) => d.confidenceScore).reduce((a, b) => a + b) / total : 0.0;

    // Model Health: accuracy from SKUForecastCollection
    final forecasts = await _isar.sKUForecastCollections.where().findAll();
    final withActual = forecasts.where((f) => f.actualQuantity != null && f.actualQuantity != 0).toList();
    _avgAccuracy = withActual.isNotEmpty
        ? withActual.map((f) => f.accuracyPercent).reduce((a, b) => a + b) / withActual.length
        : 0.0;
    if (mounted) setState(() {});
  }

  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      _networkService.clearTokens();
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Slate-50
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              _buildHeader(context, _adminName, "Administrator"),
              const SizedBox(height: 24),

              // 2. AI Performance Slider
              Text(
                "AI Model Performance",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B), // Slate-800
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(
                height: 180,
                child: _AIMetricsSlider(),
              ),
              const SizedBox(height: 24),

              // 3. Actions Box
              Text(
                "Quick Actions",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 12),
              _buildActionsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String name, String role) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6), // Blue-500
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B82F6).withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              name.substring(0, 1).toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A), // Slate-900
              ),
            ),
            Text(
              role,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF64748B), // Slate-500
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: _isOnline && !_isSyncing ? _triggerSync : null,
                  icon: _isSyncing
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.sync, size: 20),
                  color: const Color(0xFF64748B),
                  tooltip: 'Sync',
                ),
                IconButton(
                  onPressed: _handleLogout,
                  icon: const Icon(Icons.logout, size: 20, color: Colors.red),
                  tooltip: 'Logout',
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
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
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF64748B),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Last sync: $_lastSync',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionsGrid(BuildContext context) {
    // Shared color for all icons (Teal/Dark Cyan)
    const Color iconColor = Color(0xFF00796B); 

    final actions = [
      _ActionItem(
        icon: Icons.domain_outlined, // Building icon
        label: "Manages Warehouse",
        color: iconColor,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.warehouses);
        },
      ),
      _ActionItem(
        icon: Icons.people_outline,
        label: "Manages Users",
        color: iconColor,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.userManagement);
        },
      ),
      _ActionItem(
        icon: Icons.local_offer_outlined, // Tag icon
        label: "Manage Products",
        color: iconColor,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.productManagement);
        },
      ),
      _ActionItem(
        icon: Icons.shopping_basket_outlined,
        label: "Manages Warehouse Vehicles",
        color: iconColor,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.chariots);
        },
      ),
      _ActionItem(
        icon: Icons.rate_review_outlined,
        label: "Review AI Orders",
        color: iconColor,
        onTap: () {
          // TODO: Implement AdminReviewAiOrdersPage
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Review AI Orders - Coming soon')),
          );
        },
      ),
      _ActionItem(
        icon: Icons.remove_red_eye_outlined,
        label: "Monitor Warehouses",
        color: iconColor,
        onTap: () {
          // TODO: Implement AdminMonitorPage
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Monitor Warehouses - Coming soon')),
          );
        },
      ),
    ];

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: actions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return _ActionCard(item: actions[index], isCentered: true);
          },
        ),
        const SizedBox(height: 12),
        // Full width "Logs" button
        _ActionCard(
          item: _ActionItem(
            icon: Icons.receipt_long_outlined,
            label: "Logs",
            color: iconColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminHistoryLogsPage(),
                ),
              );
            },
          ),
          isCentered: true,
          isFullWidth: true,
        ),
      ],
    );
  }
}

class _AIMetricsSlider extends StatefulWidget {
  const _AIMetricsSlider();

  @override
  State<_AIMetricsSlider> createState() => _AIMetricsSliderState();
}

class _AIMetricsSliderState extends State<_AIMetricsSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              _MetricsCard1(), // Overridden vs Validated
              _MetricsCard2(), // Accuracy & Confidence
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? const Color(0xFF3B82F6)
                    : const Color(0xFFCBD5E1),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _MetricsCard1 extends StatelessWidget {
  const _MetricsCard1();

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_AdminDashboardPageState>();
    final validatedPercent = state?._validatedPercent ?? 0.0;
    final overriddenPercent = state?._overriddenPercent ?? 0.0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Decisions",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7), // Green-100
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${((validatedPercent - overriddenPercent) * 100).toStringAsFixed(1)}% diff",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF166534), // Green-800
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          // Visualization
          Row(
            children: [
              Expanded(
                flex: (validatedPercent * 100).toInt(),
                child: Container(
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF10B981), // Emerald-500
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(6)),
                  ),
                ),
              ),
              Expanded(
                flex: (overriddenPercent * 100).toInt(),
                child: Container(
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEF4444), // Red-500
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(6)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${(validatedPercent * 100).toStringAsFixed(1)}%",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF10B981),
                    ),
                  ),
                  Text(
                    "Validated (AI)",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${(overriddenPercent * 100).toStringAsFixed(1)}%",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFEF4444),
                    ),
                  ),
                  Text(
                    "Overridden (Manual)",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricsCard2 extends StatelessWidget {
  const _MetricsCard2();

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_AdminDashboardPageState>();
    final accuracy = state?._avgAccuracy ?? 0.0;
    final confidence = state?._avgConfidence ?? 0.0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
            "Model Health",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCircularIndicator("Accuracy", accuracy, const Color(0xFF3B82F6)),
              Container(width: 1, height: 60, color: const Color(0xFFE2E8F0)),
              _buildCircularIndicator("Confidence", confidence, const Color(0xFF8B5CF6)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIndicator(String label, double value, Color color) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 6,
                    backgroundColor: color.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${(value * 100).toInt()}%",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}

class _ActionItem {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  _ActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}

class _ActionCard extends StatelessWidget {
  final _ActionItem item;
  final bool isCentered;
  final bool isFullWidth;

  const _ActionCard({
    required this.item,
    this.isCentered = false,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      height: isFullWidth ? 100 : null, // Fixed height for full width logs
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: item.onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: isCentered 
                  ? CrossAxisAlignment.center 
                  : CrossAxisAlignment.start,
              children: [
                item.icon == Icons.receipt_long_outlined && isFullWidth
                    ? Icon(item.icon, color: item.color, size: 32)
                    : Container(
                        padding: const EdgeInsets.all(10), // Slightly larger padding
                        child: Icon(
                          item.icon,
                          color: item.color,
                          size: 32, // Larger icon as per design
                        ),
                      ),
                const SizedBox(height: 8),
                Text(
                  item.label,
                  textAlign: isCentered ? TextAlign.center : TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
