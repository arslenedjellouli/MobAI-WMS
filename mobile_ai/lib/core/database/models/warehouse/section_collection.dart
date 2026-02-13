import 'package:isar/isar.dart';

part 'section_collection.g.dart';

/// Section Collection - Represents functional sections within floors
@collection
class SectionCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String floorId;

  @enumerated
  late SectionType sectionType;

  late String name;
  String? description;

  /// Matrix boundaries
  @Name("start_row")
  late int startRow;

  @Name("end_row")
  late int endRow;

  @Name("start_column")
  late int startColumn;

  @Name("end_column")
  late int endColumn;

  @Name("is_active")
  bool isActive = true;

  late DateTime createdAt;
  DateTime? updatedAt;

  SectionCollection();

  SectionCollection.create({
    this.backendId,
    required this.floorId,
    required this.sectionType,
    required this.name,
    this.description,
    required this.startRow,
    required this.endRow,
    required this.startColumn,
    required this.endColumn,
    this.isActive = true,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  int get totalRows => endRow - startRow + 1;

  @ignore
  int get totalColumns => endColumn - startColumn + 1;

  @ignore
  int get totalSlots => totalRows * totalColumns;
}

enum SectionType {
  picking,
  elevator,
  monteCharge1,
  monteCharge2,
  vrac,
  expedition1,
  expedition2,
  bureau,
  paletteSlots,
  routeSlots,
}
