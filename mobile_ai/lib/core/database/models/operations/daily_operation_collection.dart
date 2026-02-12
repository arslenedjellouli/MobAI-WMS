import 'package:isar/isar.dart';

part 'daily_operation_collection.g.dart';

/// Daily Operation Collection - Tracks daily warehouse operations
@collection
class DailyOperationCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index(unique: true)
  late DateTime operationDate;

  @Name("total_chariots_available")
  int totalChariotsAvailable = 10;

  late DateTime createdAt;

  DailyOperationCollection();

  DailyOperationCollection.create({
    this.backendId,
    required this.operationDate,
    this.totalChariotsAvailable = 10,
    required this.createdAt,
    this.syncStatus = false,
    this.remoteUpdateAt  });
}
