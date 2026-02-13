import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/features/dashboard/presentation/pages/supervisor_dashboard_page.dart';
import 'package:mobile_ai/shared/widgets/app_bottom_bar.dart';

class AdminReviewAiOrdersPage extends StatelessWidget {
  const AdminReviewAiOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review AI Orders',
          style: GoogleFonts.inter(
            color: const Color(0xFF0F172A),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          tooltip: 'Back to Admin Dashboard',
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Color(0xFF0F172A),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const SupervisorDashboardPage(
        initialTab: AppBottomTab.home,
        showBottomBar: false,
        homeSection: SupervisorHomeSection.reviewOnly,
      ),
    );
  }
}
