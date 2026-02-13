import 'package:isar/isar.dart';

part 'sku_statistics_collection.g.dart';

/// SKU Statistics Collection - Tracks usage frequency for AI optimization
@collection
class SKUStatisticsCollection {
  Id id = Isar.autoIncrement;

  // Business fields
  @Index(unique: true)
  late String skuId;

  @Name("avg_frequency")
  double avgFrequency = 0;

  @Name("total_picked")
  int totalPicked = 0;

  @Name("total_received")
  int totalReceived = 0;

  @Name("last_picked_at")
  DateTime? lastPickedAt;

  @Name("last_received_at")
  DateTime? lastReceivedAt;

  late DateTime updatedAt;

  SKUStatisticsCollection();

  SKUStatisticsCollection.create({
    required this.skuId,
    this.avgFrequency = 0,
    this.totalPicked = 0,
    this.totalReceived = 0,
    this.lastPickedAt,
    this.lastReceivedAt,
    required this.updatedAt,
  });

  @ignore
  bool get isHighDemand => avgFrequency > 10; // Configurable threshold

  @ignore
  bool get isLowDemand => avgFrequency < 2;
}
