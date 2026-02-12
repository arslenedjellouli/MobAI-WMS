import 'package:isar/isar.dart';

part 'chariot_assignment_collection.g.dart';

/// Chariot Assignment Collection - Tracks chariot assignments to operations
@collection
class ChariotAssignmentCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String chariotId;

  @Index()
  late String assignedToUserId;

  @enumerated
  late ChariotOperationType operationType;

  String? referenceDocumentId;

  @Name("assigned_at")
  late DateTime assignedAt;

  @Name("released_at")
  DateTime? releasedAt;

  String? notes;

  ChariotAssignmentCollection();

  ChariotAssignmentCollection.create({
    this.backendId,
    required this.chariotId,
    required this.assignedToUserId,
    required this.operationType,
    this.referenceDocumentId,
    required this.assignedAt,
    this.releasedAt,
    this.notes,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  bool get isActive => releasedAt == null;

  @ignore
  Duration get duration {
    final endTime = releasedAt ?? DateTime.now();
    return endTime.difference(assignedAt);
  }
}

enum ChariotOperationType {
  receipt,
  replenishment,
  picking,
  delivery,
}
