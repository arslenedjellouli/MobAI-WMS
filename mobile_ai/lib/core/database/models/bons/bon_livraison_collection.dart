import 'package:isar/isar.dart';

part 'bon_livraison_collection.g.dart';

/// BON Livraison Collection - Delivery validation
@collection
class BonLivraisonCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String warehouseId;
  late String dailyOperationId;
  
  /// Related picking order
  String? bonPickingId;

  late String deliveryId;
  late String employeeId;

  @enumerated
  late BonLivraisonStatus status;

  late DateTime createdAt;
  DateTime? updatedAt;
  DateTime? completedAt;

  String? notes;

  BonLivraisonCollection();

  BonLivraisonCollection.create({
    this.backendId,
    required this.warehouseId,
    required this.dailyOperationId,
    this.bonPickingId,
    required this.deliveryId,
    required this.employeeId,
    this.status = BonLivraisonStatus.idle,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.notes,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isComplete => status == BonLivraisonStatus.done;

  @ignore
  bool get hasFailed => status == BonLivraisonStatus.failed;
}

enum BonLivraisonStatus {
  idle,
  inProgress,
  done,
  failed,
}
