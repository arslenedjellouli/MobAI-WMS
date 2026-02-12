import 'package:isar/isar.dart';

part 'sku_collection.g.dart';

/// SKU Collection - Product master data
@collection
class SKUCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index(unique: true)
  late String skuCode;

  late String name;

  double? weight;
  double? volume;

  /// Minimum quantity threshold for picking zone
  @Name("min_picking_threshold")
  int minPickingThreshold = 0;

  /// Maximum capacity for picking zone
  @Name("max_picking_capacity")
  int? maxPickingCapacity;

  /// Bulk items go to VRAC, others may go to PICKING
  @Name("is_bulk")
  bool isBulk = false;

  late DateTime createdAt;
  DateTime? updatedAt;

  SKUCollection();

  SKUCollection.create({
    this.backendId,
    required this.skuCode,
    required this.name,
    this.weight,
    this.volume,
    this.minPickingThreshold = 0,
    this.maxPickingCapacity,
    this.isBulk = false,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get shouldGoToPicking => !isBulk;
}
