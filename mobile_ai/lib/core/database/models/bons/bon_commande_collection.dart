import 'package:isar/isar.dart';

part 'bon_commande_collection.g.dart';

/// BON Commande Collection - Receipt operations
@collection
class BonCommandeCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String warehouseId;
  late String employeeId;
  String? dailyOperationId;

  @enumerated
  late BonCommandeStatus status;

  @Name("total_quantity_expected")
  int totalQuantityExpected = 0;

  @Name("total_quantity_received")
  int totalQuantityReceived = 0;

  late DateTime createdAt;
  DateTime? updatedAt;
  DateTime? completedAt;

  String? notes;

  BonCommandeCollection();

  BonCommandeCollection.create({
    this.backendId,
    required this.warehouseId,
    required this.employeeId,
    this.dailyOperationId,
    this.status = BonCommandeStatus.pending,
    this.totalQuantityExpected = 0,
    this.totalQuantityReceived = 0,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.notes,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isComplete => status == BonCommandeStatus.completed;

  @ignore
  bool get isInProgress => status == BonCommandeStatus.inProgress;
}

enum BonCommandeStatus {
  pending,
  inProgress,
  completed,
}
