import 'package:flutter/material.dart';
import 'package:mobile_ai/features/dashboard/presentation/pages/admin_dashboard_page.dart';

import 'package:mobile_ai/features/dashboard/presentation/pages/employee_dashboard_page.dart';
import 'package:mobile_ai/features/auth/presentation/pages/splash_page.dart';
import 'package:mobile_ai/features/auth/presentation/pages/login_page.dart';
import 'package:mobile_ai/features/auth/presentation/pages/access_help_page.dart';
import 'package:mobile_ai/features/auth/presentation/pages/pin_locked_page.dart';
import 'package:mobile_ai/features/dashboard/presentation/pages/supervisor_dashboard_page.dart';

import 'package:mobile_ai/features/users/presentation/pages/user_management_page.dart';
import 'package:mobile_ai/features/users/presentation/pages/add_user_page.dart';
import 'package:mobile_ai/features/users/presentation/pages/edit_user_page.dart';
import 'package:mobile_ai/features/users/data/models/user_api_models.dart';

import 'package:mobile_ai/features/inventory/presentation/pages/product_management_page.dart';
import 'package:mobile_ai/features/inventory/presentation/pages/add_product_page.dart';
import 'package:mobile_ai/features/inventory/presentation/pages/edit_product_page.dart';
import 'package:mobile_ai/features/inventory/data/models/product_api_models.dart';

import 'package:mobile_ai/features/chariots/presentation/pages/chariot_management_page.dart';
import 'package:mobile_ai/features/chariots/presentation/pages/add_chariot_page.dart';
import 'package:mobile_ai/features/chariots/presentation/pages/edit_chariot_page.dart';
import 'package:mobile_ai/features/chariots/data/models/chariot_api_models.dart';

import 'package:mobile_ai/features/warehouse/presentation/pages/warehouse_management_page.dart';
import 'package:mobile_ai/features/warehouse/presentation/pages/add_warehouse_page.dart';
import 'package:mobile_ai/features/warehouse/presentation/pages/edit_warehouse_page.dart';
import 'package:mobile_ai/features/warehouse/data/models/warehouse_api_models.dart';


// TODO: Import pages as they are created
// import 'package:mobile_ai/features/auth/presentation/pages/splash_page.dart';
// import 'package:mobile_ai/features/auth/presentation/pages/login_page.dart';
// import 'package:mobile_ai/features/dashboard/presentation/pages/dashboard_page.dart';

class AppRoutes {
  // Auth Routes
  static const String splash = '/';
  static const String login = '/login';
  static const String authHelp = '/login/help';
  static const String pinLocked = '/login/pin-locked';

  // Dashboard Routes
  static const String dashboard = '/dashboard';
  static const String adminDashboard = '/admin-dashboard';
  // User Management Routes
  static const String userManagement = '/users';
  static const String addUser = '/users/add';
  static const String editUser = '/users/edit';

  // Product Management Routes
  static const String productManagement = '/products';
  static const String addProduct = '/products/add';
  static const String editProduct = '/products/edit';
  static const String supervisorDashboard = '/supervisor-dashboard';

  // Daily Operation Routes
  static const String dailyOperation = '/daily-operation';

  // Warehouse Routes
  static const String warehouses = '/warehouses';
  static const String addWarehouse = '/warehouses/add';
  static const String editWarehouse = '/warehouses/edit';
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
  static const String addChariot = '/chariots/add';
  static const String editChariot = '/chariots/edit';
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
          builder: (_) => const SplashPage(),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      case authHelp:
        return MaterialPageRoute(
          builder: (_) => const AccessHelpPage(),
        );

      case pinLocked:
        return MaterialPageRoute(
          builder: (_) => const PinLockedPage(),
        );

      case dashboard:
        return MaterialPageRoute(
          builder: (_) => const EmployeeDashboardPage(),
        );

      case adminDashboard:
        return MaterialPageRoute(
          builder: (_) => const AdminDashboardPage(),
        );

      case userManagement:
        return MaterialPageRoute(
          builder: (_) => const UserManagementPage(),
        );

      case addUser:
        return MaterialPageRoute(
          builder: (_) => const AddUserPage(),
        );

      case editUser:
        final user = settings.arguments as UserApiModel;
        return MaterialPageRoute(
          builder: (_) => EditUserPage(user: user),
        );

      case productManagement:
        return MaterialPageRoute(
          builder: (_) => const ProductManagementPage(),
        );

      case addProduct:
        return MaterialPageRoute(
          builder: (_) => const AddProductPage(),
        );

      case editProduct:
        final product = settings.arguments as ProductApiModel;
        return MaterialPageRoute(
          builder: (_) => EditProductPage(product: product),
        );

      case chariots:
        return MaterialPageRoute(
          builder: (_) => const ChariotManagementPage(),
        );

      case addChariot:
        return MaterialPageRoute(
          builder: (_) => const AddChariotPage(),
        );

      case editChariot:
        final chariot = settings.arguments as ChariotApiModel;
        return MaterialPageRoute(
          builder: (_) => EditChariotPage(chariot: chariot),
        );

      case warehouses:
        return MaterialPageRoute(
          builder: (_) => const WarehouseManagementPage(),
        );

      case addWarehouse:
        return MaterialPageRoute(
          builder: (_) => const AddWarehousePage(),
        );

      case editWarehouse:
        final warehouse = settings.arguments as WarehouseApiModel;
        return MaterialPageRoute(
          builder: (_) => EditWarehousePage(warehouse: warehouse),
        );

      case supervisorDashboard:
        return MaterialPageRoute(
          builder: (_) => const SupervisorDashboardPage(),
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



