import 'package:isar/isar.dart';

part 'chariot_collection.g.dart';

/// Chariot Collection - Available chariots for warehouse operations
@collection
class ChariotCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index(unique: true)
  late String code;

  late String name;

  @enumerated
  late ChariotCapacityType capacityType;

  @enumerated
  late ChariotStatus status;

  String? notes;

  late DateTime createdAt;
  DateTime? updatedAt;

  ChariotCollection();

  ChariotCollection.create({
    this.backendId,
    required this.code,
    required this.name,
    this.capacityType = ChariotCapacityType.defaultType,
    this.status = ChariotStatus.available,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  double get capacityInCubicMeters {
    switch (capacityType) {
      case ChariotCapacityType.small:
        return 2.5;
      case ChariotCapacityType.defaultType:
        return 5.0;
      case ChariotCapacityType.large:
        return 10.0;
    }
  }

  @ignore
  bool get isAvailable => status == ChariotStatus.available;
}

enum ChariotCapacityType {
  small,      // 2.5 m³
  defaultType,    // 5 m³
  large,      // 10 m³
}

enum ChariotStatus {
  available,
  assigned,
  maintenance,
}
