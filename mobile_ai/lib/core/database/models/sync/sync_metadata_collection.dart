import 'package:isar/isar.dart';

part 'sync_metadata_collection.g.dart';

/// Sync Metadata Collection - Tracks last sync timestamps per entity type
@collection
class SyncMetadataCollection {
  Id id = Isar.autoIncrement;

  /// Entity type (e.g., "sku", "location", "bon_commande")
  @Index(unique: true)
  late String entityType;

  /// Last successful pull sync timestamp
  @Name("last_pull_at")
  DateTime? lastPullAt;

  /// Last successful push sync timestamp
  @Name("last_push_at")
  DateTime? lastPushAt;

  /// Total records pulled in last sync
  @Name("last_pull_count")
  int lastPullCount = 0;

  /// Total records pushed in last sync
  @Name("last_push_count")
  int lastPushCount = 0;

  /// Last sync error (if any)
  @Name("last_error")
  String? lastError;

  SyncMetadataCollection();

  SyncMetadataCollection.create({
    required this.entityType,
    this.lastPullAt,
    this.lastPushAt,
    this.lastPullCount = 0,
    this.lastPushCount = 0,
    this.lastError,
  });
}
