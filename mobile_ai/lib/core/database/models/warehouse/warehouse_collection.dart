import 'package:isar/isar.dart';

part 'warehouse_collection.g.dart';

/// Warehouse Collection - Stores warehouse master data
@collection
class WarehouseCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index(unique: true)
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String name;
  
  @Index(unique: true)
  late String code;

  late DateTime createdAt;
  DateTime? updatedAt;

  WarehouseCollection();

  WarehouseCollection.create({
    this.backendId,
    required this.name,
    required this.code,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });
}
