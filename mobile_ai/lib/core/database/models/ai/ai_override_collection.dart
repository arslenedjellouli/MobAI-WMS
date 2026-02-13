import 'package:isar/isar.dart';

part 'ai_override_collection.g.dart';

/// AI Override Collection - Tracks supervisor overrides for AI learning
@collection
class AIOverrideCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String aiDecisionId;

  late String overriddenByUserId;

  late String justification;

  /// JSON-encoded new decision (what supervisor chose instead)
  @Name("new_decision")
  late String newDecision;

  late DateTime createdAt;

  AIOverrideCollection();

  AIOverrideCollection.create({
    this.backendId,
    required this.aiDecisionId,
    required this.overriddenByUserId,
    required this.justification,
    required this.newDecision,
    required this.createdAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });
}
