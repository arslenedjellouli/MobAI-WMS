import 'package:isar/isar.dart';

part 'floor_collection.g.dart';

/// Floor Collection - Represents warehouse floors (Ground + Storage levels 1-4)
@collection
class FloorCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String warehouseId;

  /// Floor level (0=Ground, 1-4=Storage)
  @Index()
  late int levelNumber;

  /// Floor type
  @enumerated
  late FloorType floorType;

  String? description;

  /// Matrix dimensions
  @Name("matrix_rows")
  int matrixRows = 10;

  @Name("matrix_columns")
  int matrixColumns = 10;

  late DateTime createdAt;
  DateTime? updatedAt;

  FloorCollection();

  FloorCollection.create({
    this.backendId,
    required this.warehouseId,
    required this.levelNumber,
    required this.floorType,
    this.description,
    this.matrixRows = 10,
    this.matrixColumns = 10,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isGroundFloor => levelNumber == 0;

  @ignore
  bool get isStorageFloor => levelNumber > 0;
}

enum FloorType {
  ground,
  storage,
}
