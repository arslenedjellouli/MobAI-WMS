import 'package:isar/isar.dart';

part 'ai_decision_collection.g.dart';

/// AI Decision Collection - Stores AI-generated decisions for supervisor review
@collection
class AIDecisionCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @enumerated
  late AIDecisionType decisionType;

  /// JSON-encoded input data provided to AI
  @Name("input_data")
  late String inputData;

  /// JSON-encoded AI output/recommendation
  @Name("output_decision")
  late String outputDecision;

  @Name("confidence_score")
  late double confidenceScore;

  @enumerated
  late AIDecisionStatus status;

  String? validatedByUserId;
  DateTime? validatedAt;

  late DateTime createdAt;

  AIDecisionCollection();

  AIDecisionCollection.create({
    this.backendId,
    required this.decisionType,
    required this.inputData,
    required this.outputDecision,
    required this.confidenceScore,
    this.status = AIDecisionStatus.pending,
    this.validatedByUserId,
    this.validatedAt,
    required this.createdAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isPending => status == AIDecisionStatus.pending;

  @ignore
  bool get isValidated => status == AIDecisionStatus.validated;

  @ignore
  bool get isOverridden => status == AIDecisionStatus.overridden;

  @ignore
  bool get isHighConfidence => confidenceScore >= 0.8;
}

enum AIDecisionType {
  storageAssignment,
  preparationGeneration,
  pickingOptimization,
  replenishmentGeneration,
}

enum AIDecisionStatus {
  pending,
  validated,
  overridden,
  rejected,
}
