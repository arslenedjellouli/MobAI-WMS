import 'package:isar/isar.dart';

part 'sync_queue_collection.g.dart';

/// Sync Queue Collection - Stores pending sync operations for offline support
@collection
class SyncQueueCollection {
  Id id = Isar.autoIncrement;

  /// Unique identifier for this queue item (UUID)
  @Index(unique: true)
  late String queueId;

  /// Type of sync operation to perform
  @enumerated
  late SyncOperationType operationType;

  /// JSON-encoded data payload for the operation
  late String dataJson;

  /// When this item was added to queue
  @Name("created_at")
  late DateTime createdAt;

  /// Number of retry attempts made
  @Name("retry_count")
  late int retryCount;

  /// Current status of this sync operation
  @enumerated
  late SyncQueueStatus status;

  /// Last error message (if any)
  @Name("last_error")
  String? lastError;

  /// Last attempt timestamp
  @Name("last_attempt_at")
  DateTime? lastAttemptAt;

  /// Priority (higher = more urgent, 10=critical, 5=medium, 1=low)
  late int priority;

  SyncQueueCollection();

  /// Create new queue item
  SyncQueueCollection.create({
    required this.queueId,
    required this.operationType,
    required this.dataJson,
    required this.createdAt,
    this.retryCount = 0,
    this.status = SyncQueueStatus.pending,
    this.lastError,
    this.lastAttemptAt,
    this.priority = 5,
  });
}

/// Types of sync operations
enum SyncOperationType {
  // BON operations
  pushBonCommande,
  pushBonPreparation,
  pushBonReplenishment,
  pushBonPicking,
  pushBonLivraison,
  
  // Stock operations
  pushStockMovement,
  pushStockAdjustment,
  
  // Reservation operations
  pushLocationReservation,
  
  // AI operations
  pushAIDecision,
  pushAIOverride,
  validateAIDecision,
  
  // Task operations
  pushChariotAssignment,
  pushTaskReport,
  
  // Master data pull
  pullMasterData,
}

/// Status of sync queue item
enum SyncQueueStatus {
  pending,
  inProgress,
  completed,
  failed,
}
