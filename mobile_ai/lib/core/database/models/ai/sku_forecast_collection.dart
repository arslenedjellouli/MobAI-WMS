import 'package:isar/isar.dart';

part 'sku_forecast_collection.g.dart';

/// SKU Forecast Collection - AI predictions vs actual for learning
@collection
class SKUForecastCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  late String skuId;

  @Index()
  late DateTime forecastDate;

  @Name("predicted_quantity")
  late int predictedQuantity;

  @Name("actual_quantity")
  int? actualQuantity;

  @Name("confidence_score")
  late double confidenceScore;

  late DateTime createdAt;
  DateTime? updatedAt;

  SKUForecastCollection();

  SKUForecastCollection.create({
    this.backendId,
    required this.skuId,
    required this.forecastDate,
    required this.predictedQuantity,
    this.actualQuantity,
    required this.confidenceScore,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
 bool get hasActual => actualQuantity != null;

  @ignore
  double get forecastError {
    if (actualQuantity == null) return 0;
    return (predictedQuantity - actualQuantity!).abs().toDouble();
  }

  @ignore
  double get accuracyPercent {
    if (actualQuantity == null || actualQuantity == 0) return 0;
    return (1 - (forecastError / actualQuantity!)) * 100;
  }
}
