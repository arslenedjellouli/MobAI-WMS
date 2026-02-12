import 'package:isar/isar.dart';

part 'bon_replenishment_item_collection.g.dart';

/// BON Replenishment Item Collection - Items to move from VRAC to PICKING
@collection
class BonReplenishmentItemCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String bonReplenishmentId;

  late String skuId;

  /// Source location (VRAC zone)
  @Name("from_location_id")
  late String fromLocationId;

  /// Destination location (PICKING zone)
  @Name("to_location_id")
  late String toLocationId;

  late int quantity;

  /// Route optimization sequence
  @Name("sequence_number")
  int? sequenceNumber;

  late DateTime createdAt;
  DateTime? updatedAt;

  BonReplenishmentItemCollection();

  BonReplenishmentItemCollection.create({
    this.backendId,
    required this.bonReplenishmentId,
    required this.skuId,
    required this.fromLocationId,
    required this.toLocationId,
    required this.quantity,
    this.sequenceNumber,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });
}
