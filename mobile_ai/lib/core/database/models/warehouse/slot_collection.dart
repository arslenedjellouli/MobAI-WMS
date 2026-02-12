import 'package:isar/isar.dart';

part 'slot_collection.g.dart';

/// Slot Collection - Individual matrix positions within sections
@collection
class SlotCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String floorId;
  late String sectionId;

  late int row;

  @Name("column_num")
  late int column;

  /// Unique slot code (e.g., "GF-R01-C05")
  @Index(unique: true)
  late String code;

  @Name("is_storage")
  bool isStorage = false;

  @Name("is_infrastructure")
  bool isInfrastructure = false;

  @Name("is_aisle")
  bool isAisle = false;

  @Name("is_active")
  bool isActive = true;

  String? notes;

  late DateTime createdAt;
  DateTime? updatedAt;

  SlotCollection();

  SlotCollection.create({
    this.backendId,
    required this.floorId,
    required this.sectionId,
    required this.row,
    required this.column,
    required this.code,
    this.isStorage = false,
    this.isInfrastructure = false,
    this.isAisle = false,
    this.isActive = true,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isUsableForStorage => isStorage && !isInfrastructure && !isAisle && isActive;
}
