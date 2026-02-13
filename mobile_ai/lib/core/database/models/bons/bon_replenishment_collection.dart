import 'package:isar/isar.dart';

part 'bon_replenishment_collection.g.dart';

/// BON Replenishment Collection - VRAC → PICKING transfers (AI-triggered)
@collection
class BonReplenishmentCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String warehouseId;
  late String dailyOperationId;

  late String employeeId;

  @enumerated
  late BonReplenishmentStatus status;

  /// AI confidence for this replenishment plan
  @Name("confidence_score")
  double? confidenceScore;

  late DateTime createdAt;
  DateTime? updatedAt;
  DateTime? completedAt;

  String? notes;

  BonReplenishmentCollection();

  BonReplenishmentCollection.create({
    this.backendId,
    required this.warehouseId,
    required this.dailyOperationId,
    required this.employeeId,
    this.status = BonReplenishmentStatus.pending,
    this.confidenceScore,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.notes,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isComplete => status == BonReplenishmentStatus.completed;
}

enum BonReplenishmentStatus {
  pending,
  inProgress,
  completed,
  cancelled,
}
