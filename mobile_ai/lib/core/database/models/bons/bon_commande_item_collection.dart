import 'package:isar/isar.dart';

part 'bon_commande_item_collection.g.dart';

/// BON Commande Item Collection - Individual items in receipt
@collection
class BonCommandeItemCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String bonCommandeId;

  late String skuId;

  @Name("quantity_expected")
  late int quantityExpected;

  @Name("actual_quantity_received")
  int actualQuantityReceived = 0;

  late DateTime createdAt;
  DateTime? updatedAt;

  BonCommandeItemCollection();

  BonCommandeItemCollection.create({
    this.backendId,
    required this.bonCommandeId,
    required this.skuId,
    required this.quantityExpected,
    this.actualQuantityReceived = 0,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isFullyReceived => actualQuantityReceived >= quantityExpected;

  @ignore
  int get remainingQuantity => quantityExpected - actualQuantityReceived;
}
