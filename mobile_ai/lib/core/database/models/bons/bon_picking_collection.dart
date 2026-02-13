import 'package:isar/isar.dart';

part 'bon_picking_collection.g.dart';

/// BON Picking Collection - Optimized picking route execution
@collection
class BonPickingCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String warehouseId;
  String? dailyOperationId;
  
  /// Related preparation order
  String? bonPreparationId;

  late String employeeId;

  @enumerated
  late BonPickingStatus status;

  /// AI-calculated optimal distance
  @Name("total_distance")
  double? totalDistance;

  @Name("estimated_duration")
  int? estimatedDuration; // in seconds

  late DateTime createdAt;
  DateTime? updatedAt;
  DateTime? completedAt;

  String? notes;

  BonPickingCollection();

  BonPickingCollection.create({
    this.backendId,
    required this.warehouseId,
    this.dailyOperationId,
    this.bonPreparationId,
    required this.employeeId,
    this.status = BonPickingStatus.pending,
    this.totalDistance,
    this.estimatedDuration,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.notes,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isComplete => status == BonPickingStatus.completed;

  @ignore
  bool get hasAIRoute => totalDistance != null;
}

enum BonPickingStatus {
  pending,
  inProgress,
  completed,
  cancelled,
}
