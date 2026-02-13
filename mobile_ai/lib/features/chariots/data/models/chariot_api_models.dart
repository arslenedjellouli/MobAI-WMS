import 'package:json_annotation/json_annotation.dart';

part 'chariot_api_models.g.dart';

/// Chariot API Model - Response from backend
@JsonSerializable(fieldRename: FieldRename.snake)
class ChariotApiModel {
  final String id;
  final String code;
  final String type;
  final double capacity;
  final String status;
  final String? currentOperator;
  final String? operatorName;
  final String? currentLocation;
  final String? locationCode;
  final String? lastMaintenanceDate;
  final String? nextMaintenanceDate;
  final int? assignmentsCount;
  final bool? isMaintenanceDue;
  final String? createdAt;
  final String? updatedAt;

  ChariotApiModel({
    required this.id,
    required this.code,
    required this.type,
    required this.capacity,
    required this.status,
    this.currentOperator,
    this.operatorName,
    this.currentLocation,
    this.locationCode,
    this.lastMaintenanceDate,
    this.nextMaintenanceDate,
    this.assignmentsCount,
    this.isMaintenanceDue,
    this.createdAt,
    this.updatedAt,
  });

  factory ChariotApiModel.fromJson(Map<String, dynamic> json) =>
      _$ChariotApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChariotApiModelToJson(this);

  /// Get status display text
  String get statusDisplay {
    switch (status.toUpperCase()) {
      case 'AVAILABLE':
        return 'Available';
      case 'IN_USE':
        return 'In Use';
      case 'MAINTENANCE':
        return 'Maintenance';
      case 'OUT_OF_SERVICE':
        return 'Out of Service';
      default:
        return status;
    }
  }

  /// Get status color indicator
  String get statusColor {
    switch (status.toUpperCase()) {
      case 'AVAILABLE':
        return 'green';
      case 'IN_USE':
        return 'blue';
      case 'MAINTENANCE':
        return 'orange';
      case 'OUT_OF_SERVICE':
        return 'red';
      default:
        return 'grey';
    }
  }
}

/// Chariot Create Request - For creating new chariot
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ChariotCreateRequest {
  final String code;
  final String type;
  final double capacity;
  final String status;
  final String? currentOperator;
  final String? currentLocation;
  final String? lastMaintenanceDate;
  final String? nextMaintenanceDate;

  ChariotCreateRequest({
    required this.code,
    required this.type,
    required this.capacity,
    required this.status,
    this.currentOperator,
    this.currentLocation,
    this.lastMaintenanceDate,
    this.nextMaintenanceDate,
  });

  factory ChariotCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ChariotCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChariotCreateRequestToJson(this);
}

/// Chariot Update Request - For updating existing chariot
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ChariotUpdateRequest {
  final String? code;
  final String? type;
  final double? capacity;
  final String? status;
  final String? currentOperator;
  final String? currentLocation;
  final String? lastMaintenanceDate;
  final String? nextMaintenanceDate;

  ChariotUpdateRequest({
    this.code,
    this.type,
    this.capacity,
    this.status,
    this.currentOperator,
    this.currentLocation,
    this.lastMaintenanceDate,
    this.nextMaintenanceDate,
  });

  factory ChariotUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ChariotUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChariotUpdateRequestToJson(this);
}

/// Chariot List Response - Paginated list from backend
@JsonSerializable(fieldRename: FieldRename.snake)
class ChariotListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<ChariotApiModel> results;

  ChariotListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ChariotListResponse.fromJson(Map<String, dynamic> json) =>
      _$ChariotListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChariotListResponseToJson(this);
}
