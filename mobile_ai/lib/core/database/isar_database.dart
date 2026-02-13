import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Sync collections
import 'models/sync/sync_queue_collection.dart';
import 'models/sync/sync_metadata_collection.dart';

// Auth collections
import 'models/auth/user_collection.dart';
import 'models/auth/user_session_collection.dart';

// Warehouse collections
import 'models/warehouse/warehouse_collection.dart';
import 'models/warehouse/floor_collection.dart';
import 'models/warehouse/section_collection.dart';
import 'models/warehouse/slot_collection.dart';
import 'models/warehouse/zone_collection.dart';
import 'models/warehouse/location_collection.dart';

// Inventory collections
import 'models/inventory/sku_collection.dart';
import 'models/inventory/sku_statistics_collection.dart';
import 'models/inventory/stock_collection.dart';
import 'models/inventory/stock_ledger_collection.dart';
import 'models/inventory/picking_stock_status_collection.dart';

// Operations collections
import 'models/operations/daily_operation_collection.dart';
import 'models/operations/chariot_collection.dart';
import 'models/operations/chariot_assignment_collection.dart';
import 'models/operations/employee_task_collection.dart';
import 'models/operations/task_report_collection.dart';

// BON collections
import 'models/bons/bon_commande_collection.dart';
import 'models/bons/bon_commande_item_collection.dart';
import 'models/bons/bon_preparation_collection.dart';
import 'models/bons/bon_preparation_item_collection.dart';
import 'models/bons/bon_replenishment_collection.dart';
import 'models/bons/bon_replenishment_item_collection.dart';
import 'models/bons/bon_picking_collection.dart';
import 'models/bons/bon_picking_item_collection.dart';
import 'models/bons/bon_livraison_collection.dart';
import 'models/bons/bon_livraison_item_collection.dart';

// Reservation collections
import 'models/reservations/location_reservation_collection.dart';

// AI collections
import 'models/ai/ai_decision_collection.dart';
import 'models/ai/ai_override_collection.dart';
import 'models/ai/sku_forecast_collection.dart';

/// IsarDatabase - Manages local database initialization and access
class IsarDatabase {
  static Isar? _isar;

  /// Initialize the Isar database with all collections
  Future<void> initialize() async {
    if (_isar != null) {
      print('⚠️ Isar database already initialized');
      return;
    }

    print('🔧 Initializing Isar database...');

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        // Sync (2)
        SyncQueueCollectionSchema,
        SyncMetadataCollectionSchema,

        // Auth (2)
        UserCollectionSchema,
        UserSessionCollectionSchema,

        // Warehouse (6)
        WarehouseCollectionSchema,
        FloorCollectionSchema,
        SectionCollectionSchema,
        SlotCollectionSchema,
        ZoneCollectionSchema,
        LocationCollectionSchema,

        // Inventory (5)
        SKUCollectionSchema,
        SKUStatisticsCollectionSchema,
        StockCollectionSchema,
        StockLedgerCollectionSchema,
        PickingStockStatusCollectionSchema,

        // Operations (4)
        DailyOperationCollectionSchema,
        ChariotCollectionSchema,
        ChariotAssignmentCollectionSchema,
        EmployeeTaskCollectionSchema,
        TaskReportCollectionSchema,

        // BONs (10)
        BonCommandeCollectionSchema,
        BonCommandeItemCollectionSchema,
        BonPreparationCollectionSchema,
        BonPreparationItemCollectionSchema,
        BonReplenishmentCollectionSchema,
        BonReplenishmentItemCollectionSchema,
        BonPickingCollectionSchema,
        BonPickingItemCollectionSchema,
        BonLivraisonCollectionSchema,
        BonLivraisonItemCollectionSchema,

        // Reservations (1)
        LocationReservationCollectionSchema,

        // AI (3)
        AIDecisionCollectionSchema,
        AIOverrideCollectionSchema,
        SKUForecastCollectionSchema,
      ],
      directory: dir.path,
      name: 'mobai_wms',
      inspector: true, // Enable Isar Inspector for debugging
    );

    print('✅ Isar database initialized successfully');
    print('📁 Path: ${dir.path}/mobai_wms.isar');
    print('🔍 Inspector: http://localhost:8080');
  }

  /// Get the Isar instance
  Isar get isar {
    if (_isar == null) {
      throw Exception(
        'Isar database not initialized. Call initialize() first.',
      );
    }
    return _isar!;
  }

  /// Close the database
  Future<void> close() async {
    await _isar?.close();
    _isar = null;
    print('🛑 Isar database closed');
  }

  /// Clear all data (for testing/debugging)
  Future<void> clearAll() async {
    final db = isar;
    await db.writeTxn(() async {
      await db.clear();
    });
    print('🗑️ All data cleared');
  }

  /// Get database statistics
  Future<Map<String, int>> getStatistics() async {
    final db = isar;
    return {
      'syncQueue': await db.syncQueueCollections.count(),
      'users': await db.userCollections.count(),
      'warehouses': await db.warehouseCollections.count(),
      'locations': await db.locationCollections.count(),
      'skus': await db.sKUCollections.count(),
      'stock': await db.stockCollections.count(),
      'bonCommandes': await db.bonCommandeCollections.count(),
      'bonPreparations': await db.bonPreparationCollections.count(),
      'bonReplenishments': await db.bonReplenishmentCollections.count(),
      'bonPickings': await db.bonPickingCollections.count(),
      'bonLivraisons': await db.bonLivraisonCollections.count(),
      'employeeTasks': await db.employeeTaskCollections.count(),
      'taskReports': await db.taskReportCollections.count(),
      'aiDecisions': await db.aIDecisionCollections.count(),
    };
  }
}
