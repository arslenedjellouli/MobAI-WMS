import 'package:isar/isar.dart';

part 'zone_collection.g.dart';

/// Zone Collection - Functional zones in warehouse (RECEIVING, VRAC, PICKING, EXPEDITION)
@collection
class ZoneCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String warehouseId;

  late String name;

  @Index()
  @enumerated
  late ZoneType type;

  late DateTime createdAt;
  DateTime? updatedAt;

  ZoneCollection();

  ZoneCollection.create({
    this.backendId,
    required this.warehouseId,
    required this.name,
    required this.type,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });
}

enum ZoneType {
  receiving,
  vrac,
  picking,
  expedition,
}
