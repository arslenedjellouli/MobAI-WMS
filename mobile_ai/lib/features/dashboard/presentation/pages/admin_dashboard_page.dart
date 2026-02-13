import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user data
    const String adminName = "Arslene"; // Or fetch from auth
    const String adminRole = "Administrator";

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Slate-50
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              _buildHeader(context, adminName, adminRole),
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
              "Welcome back, $name",
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
        IconButton(
          onPressed: () {
            // TODO: Implement notifications
          },
          icon: const Icon(Icons.notifications_outlined),
          color: const Color(0xFF64748B),
        ),
      ],
    );
  }

  Widget _buildActionsGrid(BuildContext context) {
    // Shared color for all icons (Teal/Dark Cyan)
    const Color iconColor = Color(0xFF00796B); 

    final actions = [
      _ActionItem(
        icon: Icons.warehouse_outlined,
        label: "Manage Warehouses",
        color: iconColor,
        onTap: () {},
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
        onTap: () {},
      ),
      _ActionItem(
        icon: Icons.remove_red_eye_outlined,
        label: "Monitor Warehouses",
        color: iconColor,
        onTap: () {},
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
            onTap: () {},
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
    // Mock Data
    final double validatedPercent = 0.85;
    final int totalOrders = 1250;

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
                  "+12% vs last week",
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
                flex: ((1 - validatedPercent) * 100).toInt(),
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
                    "${(validatedPercent * 100).toInt()}%",
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
                    "${((1 - validatedPercent) * 100).toInt()}%",
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
              _buildCircularIndicator("Accuracy", 0.92, const Color(0xFF3B82F6)),
              Container(width: 1, height: 60, color: const Color(0xFFE2E8F0)),
              _buildCircularIndicator("Confidence", 0.88, const Color(0xFF8B5CF6)),
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
