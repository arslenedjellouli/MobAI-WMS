import 'package:isar/isar.dart';

part 'location_reservation_collection.g.dart';

/// Location Reservation Collection - Prevents double-assignment of storage
@collection
class LocationReservationCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String locationId;

  late String skuId;

  @Name("quantity_reserved")
  late int quantityReserved;

  @enumerated
  late ReferenceDocumentType referenceDocumentType;

  late String referenceDocumentId;

  @enumerated
  late ReservationStatus status;

  late DateTime createdAt;
  DateTime? updatedAt;
  DateTime? completedAt;
  DateTime? cancelledAt;

  LocationReservationCollection();

  LocationReservationCollection.create({
    this.backendId,
    required this.locationId,
    required this.skuId,
    required this.quantityReserved,
    required this.referenceDocumentType,
    required this.referenceDocumentId,
    this.status = ReservationStatus.pending,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.cancelledAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isActive => status == ReservationStatus.active;

  @ignore
  bool get isCompleted => status == ReservationStatus.completed;
}

enum ReferenceDocumentType {
  bonCommande,
  bonPreparation,
  bonReplenishment,
  bonPicking,
}

enum ReservationStatus {
  pending,
  active,
  completed,
  cancelled,
}
