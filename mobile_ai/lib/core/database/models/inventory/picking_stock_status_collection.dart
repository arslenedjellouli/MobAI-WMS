import 'package:isar/isar.dart';

part 'picking_stock_status_collection.g.dart';

/// Picking Stock Status Collection - Tracks stock specifically in PICKING zone
/// Used to trigger auto-replenishment when below threshold
@collection
class PickingStockStatusCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index(unique: true)
  late String skuId;

  late String warehouseId;

  @Name("current_quantity")
  late int currentQuantity;

  @Name("min_threshold")
  late int minThreshold;

  @Name("max_capacity")
  int? maxCapacity;

  @Name("last_replenishment_at")
  DateTime? lastReplenishmentAt;

  late DateTime updatedAt;

  PickingStockStatusCollection();

  PickingStockStatusCollection.create({
    this.backendId,
    required this.skuId,
    required this.warehouseId,
    required this.currentQuantity,
    required this.minThreshold,
    this.maxCapacity,
    this.lastReplenishmentAt,
    required this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get needsReplenishment => currentQuantity < minThreshold;

  @ignore
  int get replenishmentQuantity {
    if (maxCapacity == null) return minThreshold - currentQuantity;
    return maxCapacity! - currentQuantity;
  }

  @ignore
  bool get isCritical => currentQuantity < (minThreshold * 0.5);
}
