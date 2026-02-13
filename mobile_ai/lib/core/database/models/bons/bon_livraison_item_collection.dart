import 'package:isar/isar.dart';

part 'bon_livraison_item_collection.g.dart';

/// BON Livraison Item Collection - Items delivered
@collection
class BonLivraisonItemCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String bonLivraisonId;

  late String skuId;

  @Name("quantity_delivered")
  late int quantityDelivered;

  late DateTime createdAt;
  DateTime? updatedAt;

  BonLivraisonItemCollection();

  BonLivraisonItemCollection.create({
    this.backendId,
    required this.bonLivraisonId,
    required this.skuId,
    required this.quantityDelivered,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });
}
