/// API Configuration Constants
class ApiConstants {
  ApiConstants._();

  // Base URLs (override in EnvConfig)
  static const String baseUrl = '/api/v1';

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);

  // Endpoints
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refresh = '/auth/refresh';
  static const String me = '/auth/me';

  // Daily Operations
  static const String dailyOperations = '/daily-operations';

  // Warehouses
  static const String warehouses = '/warehouses';
  static const String zones = '/zones';
  static const String locations = '/locations';

  // SKUs & Stock
  static const String skus = '/skus';
  static const String stock = '/stock';
  static const String stockLedger = '/stock/ledger';

  // Chariots
  static const String chariots = '/chariots';
  static const String chariotAvailable = '/chariots/available';

  // BON Operations
  static const String bonCommande = '/bon-commande';
  static const String bonPreparation = '/bon-preparation';
  static const String bonReplenishment = '/bon-replenishment';
  static const String bonReplenishmentPending = '/bon-replenishment/pending';
  static const String bonPicking = '/bon-picking';
  static const String bonLivraison = '/bon-livraison';

  // Reservations
  static const String reservations = '/reservations';

  // Picking Stock
  static const String pickingStock = '/picking-stock';
  static const String pickingStockLow = '/picking-stock/low';

  // AI Services
  static const String aiForecast = '/ai/forecast';
  static const String aiOptimizeStorage = '/ai/optimize/storage';
  static const String aiOptimizePicking = '/ai/optimize/picking';
  static const String aiOptimizeReplenishment = '/ai/optimize/replenishment';
  static const String aiDecisions = '/ai/decisions';

  // Reports
  static const String reports = '/reports';
  static const String reportsDailySummary = '/reports/daily-summary';
}
