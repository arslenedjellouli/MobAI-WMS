import 'package:isar/isar.dart';

part 'bon_picking_item_collection.g.dart';

/// BON Picking Item Collection - Individual items to pick with sequence
@collection
class BonPickingItemCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String bonPickingId;

  late String skuId;
  late String locationId;

  late int quantity;

  /// AI-optimized picking order
  @Name("sequence_number")
  int? sequenceNumber;

  bool picked = false;
  DateTime? pickedAt;

  late DateTime createdAt;
  DateTime? updatedAt;

  BonPickingItemCollection();

  BonPickingItemCollection.create({
    this.backendId,
    required this.bonPickingId,
    required this.skuId,
    required this.locationId,
    required this.quantity,
    this.sequenceNumber,
    this.picked = false,
    this.pickedAt,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isPicked => picked;

  @ignore
  bool get isPending => !picked;
}
