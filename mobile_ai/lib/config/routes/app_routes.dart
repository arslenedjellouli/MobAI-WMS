import 'package:flutter/material.dart';

import 'package:mobile_ai/features/dashboard/presentation/pages/employee_dashboard_page.dart';

// TODO: Import pages as they are created
// import 'package:mobile_ai/features/auth/presentation/pages/splash_page.dart';
// import 'package:mobile_ai/features/auth/presentation/pages/login_page.dart';
// import 'package:mobile_ai/features/dashboard/presentation/pages/dashboard_page.dart';

class AppRoutes {
  // Auth Routes
  static const String splash = '/';
  static const String login = '/login';

  // Dashboard Routes
  static const String dashboard = '/dashboard';

  // Daily Operation Routes
  static const String dailyOperation = '/daily-operation';

  // Warehouse Routes
  static const String zones = '/zones';
  static const String zoneDetail = '/zones/:id';
  static const String locations = '/locations';
  static const String locationDetail = '/locations/:id';

  // SKU Routes
  static const String skus = '/skus';
  static const String skuDetail = '/skus/:id';

  // Stock Routes
  static const String stock = '/stock';
  static const String stockMovements = '/stock/movements';

  // Bon Commande Routes
  static const String bonCommandes = '/bon-commandes';
  static const String bonCommandeDetail = '/bon-commandes/:id';

  // Bon Preparation Routes
  static const String bonPreparations = '/bon-preparations';
  static const String bonPreparationDetail = '/bon-preparations/:id';

  // Bon Picking Routes (Most Important for Employees)
  static const String bonPickings = '/bon-pickings';
  static const String bonPickingDetail = '/bon-pickings/:id';
  static const String bonPickingScan = '/bon-pickings/:id/scan';

  // Bon Replenishment Routes
  static const String bonReplenishments = '/bon-replenishments';
  static const String bonReplenishmentDetail = '/bon-replenishments/:id';

  // Bon Livraison Routes
  static const String bonLivraisons = '/bon-livraisons';
  static const String bonLivraisonDetail = '/bon-livraisons/:id';

  // Chariot Routes
  static const String chariots = '/chariots';
  static const String chariotDetail = '/chariots/:id';

  // Reservation Routes
  static const String reservations = '/reservations';

  // AI Decisions Routes
  static const String aiDecisions = '/ai-decisions';

  // Reports Routes
  static const String reports = '/reports';

  // Settings Routes
  static const String settings = '/settings';
  static const String profile = '/profile';

  /// Route generator
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => _placeholder('Splash', 'Checking authentication...'),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => _placeholder('Login', 'Enter credentials'),
        );

      case dashboard:
        return MaterialPageRoute(
          builder: (_) => const EmployeeDashboardPage(),
        );

      case bonPickings:
        return MaterialPageRoute(
          builder: (_) => _placeholder('Bon Pickings', 'List of picking orders'),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => _placeholder('404', 'Page not found'),
        );
    }
  }

  /// Placeholder widget for routes not yet implemented
  static Widget _placeholder(String title, String subtitle) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'This page will be implemented during design phase',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
