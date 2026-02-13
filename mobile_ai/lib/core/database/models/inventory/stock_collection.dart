import 'package:isar/isar.dart';

part 'stock_collection.g.dart';

/// Stock Collection - Current inventory levels per location
@collection
class StockCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String skuId;

  @Index()
  late String locationId;

  late int quantity;

  late DateTime createdAt;
  DateTime? updatedAt;

  StockCollection();

  StockCollection.create({
    this.backendId,
    required this.skuId,
    required this.locationId,
    required this.quantity,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get hasStock => quantity > 0;
}
