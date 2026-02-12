import 'package:isar/isar.dart';

part 'bon_preparation_item_collection.g.dart';

/// BON Preparation Item Collection - Individual items in preparation order
@collection
class BonPreparationItemCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String bonPreparationId;

  late String skuId;

  @Name("quantity_to_deliver")
  late int quantityToDeliver;

  /// MUST be in PICKING zone, not VRAC
  @Name("current_storage_location_id")
  String? currentStorageLocationId;

  late DateTime createdAt;
  DateTime? updatedAt;

  BonPreparationItemCollection();

  BonPreparationItemCollection.create({
    this.backendId,
    required this.bonPreparationId,
    required this.skuId,
    required this.quantityToDeliver,
    this.currentStorageLocationId,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });
}
