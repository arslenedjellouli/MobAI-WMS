import 'package:isar/isar.dart';

part 'bon_preparation_collection.g.dart';

/// BON Preparation Collection - Outgoing order planning (AI-generated)
@collection
class BonPreparationCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String warehouseId;
  late String dailyOperationId;
  
  String? deliveryId;

  @enumerated
  late BonPreparationStatus status;

  /// AI confidence score for this prediction
  @Name("confidence_score")
  double? confidenceScore;

  String? validatedByUserId;
  DateTime? validatedAt;

  late DateTime createdAt;
  DateTime? updatedAt;

  String? notes;

  BonPreparationCollection();

  BonPreparationCollection.create({
    this.backendId,
    required this.warehouseId,
    required this.dailyOperationId,
    this.deliveryId,
    this.status = BonPreparationStatus.pending,
    this.confidenceScore,
    this.validatedByUserId,
    this.validatedAt,
    required this.createdAt,
    this.updatedAt,
    this.notes,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isPending => status == BonPreparationStatus.pending;

  @ignore
  bool get isValidated => status == BonPreparationStatus.validated;

  @ignore
  bool get isAIGenerated => confidenceScore != null;
}

enum BonPreparationStatus {
  pending,
  validated,
  overridden,
  rejected,
}
