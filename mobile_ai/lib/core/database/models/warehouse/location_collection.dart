import 'package:isar/isar.dart';

part 'location_collection.g.dart';

/// Location Collection - Physical storage locations
@collection
class LocationCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String warehouseId;

  String? floorId;

  late String zoneId;

  String? slotId;

  /// Unique location code
  @Index(unique: true)
  late String code;

  String? aisle;
  String? rack;
  String? shelf;
  String? position;

  /// Coordinates for mapping
  @Name("x_coord")
  double? xCoord;

  @Name("y_coord")
  double? yCoord;

  /// Capacity in cubic meters (default 1.3m³ per pallet)
  late double capacity;

  @Name("current_capacity_used")
  double currentCapacityUsed = 0;

  @Name("reserved_capacity")
  double reservedCapacity = 0;

  @Index()
  @enumerated
  late LocationStatus status;

  @Name("is_active")
  bool isActive = true;

  @Name("is_pallet_position")
  bool isPalletPosition = true;

  @Name("max_pallets")
  int maxPallets = 1;

  late DateTime createdAt;
  DateTime? updatedAt;

  LocationCollection();

  LocationCollection.create({
    this.backendId,
    required this.warehouseId,
    this.floorId,
    required this.zoneId,
    this.slotId,
    required this.code,
    this.aisle,
    this.rack,
    this.shelf,
    this.position,
    this.xCoord,
    this.yCoord,
    this.capacity = 1.3,
    this.currentCapacityUsed = 0,
    this.reservedCapacity = 0,
    this.status = LocationStatus.free,
    this.isActive = true,
    this.isPalletPosition = true,
    this.maxPallets = 1,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  double get availableCapacity => capacity - currentCapacityUsed - reservedCapacity;

  @ignore
  bool get hasAvailableCapacity => availableCapacity > 0;

  @ignore
  bool get isFull => currentCapacityUsed >= capacity;

  @ignore
  bool get isFree => status == LocationStatus.free && currentCapacityUsed == 0;
}

enum LocationStatus {
  free,
  assigned,
  occupied,
}
