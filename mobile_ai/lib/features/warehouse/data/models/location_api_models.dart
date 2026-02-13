import 'package:json_annotation/json_annotation.dart';

part 'location_api_models.g.dart';

/// Location API Model - Response from backend
@JsonSerializable(fieldRename: FieldRename.snake)
class LocationApiModel {
  final String id;
  final String code;
  final String? warehouse;
  final String? warehouseName;
  final String? floor;
  final String? aisle;
  final String? rack;
  final String? shelf;
  final String? position;
  @JsonKey(fromJson: _parseIntNullable)
  final int? xCoord;
  @JsonKey(fromJson: _parseIntNullable)
  final int? yCoord;
  @JsonKey(fromJson: _parseDoubleNullable)
  final double? capacity;
  final String status;
  @JsonKey(fromJson: _parseBool)
  final bool isActive;

  LocationApiModel({
    required this.id,
    required this.code,
    this.warehouse,
    this.warehouseName,
    this.floor,
    this.aisle,
    this.rack,
    this.shelf,
    this.position,
    this.xCoord,
    this.yCoord,
    this.capacity,
    required this.status,
    required this.isActive,
  });

  factory LocationApiModel.fromJson(Map<String, dynamic> json) =>
      _$LocationApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationApiModelToJson(this);

  static double? _parseDoubleNullable(Object? value) {
    if (value == null) {
      return null;
    }
    if (value is num) {
      return value.toDouble();
    }
    return double.tryParse(value.toString());
  }

  static int? _parseIntNullable(Object? value) {
    if (value == null) {
      return null;
    }
    if (value is num) {
      return value.round();
    }
    final parsedInt = int.tryParse(value.toString());
    if (parsedInt != null) {
      return parsedInt;
    }
    final parsedDouble = double.tryParse(value.toString());
    if (parsedDouble != null) {
      return parsedDouble.round();
    }
    return null;
  }

  static bool _parseBool(Object? value) {
    if (value is bool) {
      return value;
    }
    if (value is num) {
      return value != 0;
    }
    final normalized = value.toString().toLowerCase();
    return normalized == 'true' || normalized == '1' || normalized == 'yes';
  }
}
