// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chariot_api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChariotApiModel _$ChariotApiModelFromJson(Map<String, dynamic> json) =>
    ChariotApiModel(
      id: ChariotApiModel._parseString(json['id']),
      code: ChariotApiModel._parseString(json['code']),
      capacity: ChariotApiModel._parseDouble(json['capacity']),
      status: ChariotApiModel._parseString(json['status']),
      warehouse: json['warehouse'] as String?,
      warehouseName: json['warehouse_name'] as String?,
      currentOperator: json['current_operator'] as String?,
      operatorName: json['operator_name'] as String?,
      currentLocation: json['current_location'] as String?,
      locationCode: json['location_code'] as String?,
      currentPosition: json['current_position'] as String?,
      lastMaintenanceDate: json['last_maintenance_date'] as String?,
      nextMaintenanceDate: json['next_maintenance_date'] as String?,
      assignmentsCount:
          ChariotApiModel._parseIntNullable(json['assignments_count']),
      isMaintenanceDue: json['is_maintenance_due'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ChariotApiModelToJson(ChariotApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'capacity': instance.capacity,
      'status': instance.status,
      'warehouse': instance.warehouse,
      'warehouse_name': instance.warehouseName,
      'current_operator': instance.currentOperator,
      'operator_name': instance.operatorName,
      'current_location': instance.currentLocation,
      'location_code': instance.locationCode,
      'current_position': instance.currentPosition,
      'last_maintenance_date': instance.lastMaintenanceDate,
      'next_maintenance_date': instance.nextMaintenanceDate,
      'assignments_count': instance.assignmentsCount,
      'is_maintenance_due': instance.isMaintenanceDue,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ChariotCreateRequest _$ChariotCreateRequestFromJson(
        Map<String, dynamic> json) =>
    ChariotCreateRequest(
      code: json['code'] as String,
      capacity: (json['capacity'] as num).toDouble(),
      status: json['status'] as String,
      warehouse: json['warehouse'] as String?,
      currentOperator: json['current_operator'] as String?,
      currentLocation: json['current_location'] as String?,
      currentPosition: json['current_position'] as String?,
      lastMaintenanceDate: json['last_maintenance_date'] as String?,
      nextMaintenanceDate: json['next_maintenance_date'] as String?,
    );

Map<String, dynamic> _$ChariotCreateRequestToJson(
    ChariotCreateRequest instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'capacity': instance.capacity,
    'status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('warehouse', instance.warehouse);
  writeNotNull('current_operator', instance.currentOperator);
  writeNotNull('current_location', instance.currentLocation);
  writeNotNull('current_position', instance.currentPosition);
  writeNotNull('last_maintenance_date', instance.lastMaintenanceDate);
  writeNotNull('next_maintenance_date', instance.nextMaintenanceDate);
  return val;
}

ChariotUpdateRequest _$ChariotUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    ChariotUpdateRequest(
      code: json['code'] as String?,
      capacity: (json['capacity'] as num?)?.toDouble(),
      status: json['status'] as String?,
      warehouse: json['warehouse'] as String?,
      currentOperator: json['current_operator'] as String?,
      currentLocation: json['current_location'] as String?,
      currentPosition: json['current_position'] as String?,
      lastMaintenanceDate: json['last_maintenance_date'] as String?,
      nextMaintenanceDate: json['next_maintenance_date'] as String?,
    );

Map<String, dynamic> _$ChariotUpdateRequestToJson(
    ChariotUpdateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('capacity', instance.capacity);
  writeNotNull('status', instance.status);
  writeNotNull('warehouse', instance.warehouse);
  writeNotNull('current_operator', instance.currentOperator);
  writeNotNull('current_location', instance.currentLocation);
  writeNotNull('current_position', instance.currentPosition);
  writeNotNull('last_maintenance_date', instance.lastMaintenanceDate);
  writeNotNull('next_maintenance_date', instance.nextMaintenanceDate);
  return val;
}

ChariotListResponse _$ChariotListResponseFromJson(Map<String, dynamic> json) =>
    ChariotListResponse(
      count: ChariotApiModel._parseInt(json['count']),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ChariotApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChariotListResponseToJson(
        ChariotListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
