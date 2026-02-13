import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppBottomTab { home, monitor, history, search }

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final AppBottomTab currentTab;
  final ValueChanged<AppBottomTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 72,
        decoration: const BoxDecoration(
          color: Color(0xFFF8FAFC),
          border: Border(
            top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            _buildItem(
              tab: AppBottomTab.home,
              icon: Icons.home_outlined,
              label: 'Home',
            ),
            _buildItem(
              tab: AppBottomTab.monitor,
              icon: Icons.center_focus_strong,
              label: 'Monitor',
            ),
            _buildItem(
              tab: AppBottomTab.history,
              icon: Icons.history,
              label: 'History',
            ),
            _buildItem(
              tab: AppBottomTab.search,
              icon: Icons.search,
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required AppBottomTab tab,
    required IconData icon,
    required String label,
  }) {
    final isSelected = currentTab == tab;
    final color = isSelected ? const Color(0xFF3C91CC) : const Color(0xFF64748B);

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onTabSelected(tab),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
