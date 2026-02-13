// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationApiModel _$LocationApiModelFromJson(Map<String, dynamic> json) =>
    LocationApiModel(
      id: json['id'] as String,
      code: json['code'] as String,
      warehouse: json['warehouse'] as String?,
      warehouseName: json['warehouse_name'] as String?,
      floor: json['floor'] as String?,
      aisle: json['aisle'] as String?,
      rack: json['rack'] as String?,
      shelf: json['shelf'] as String?,
      position: json['position'] as String?,
      xCoord: LocationApiModel._parseIntNullable(json['x_coord']),
      yCoord: LocationApiModel._parseIntNullable(json['y_coord']),
      capacity: LocationApiModel._parseDoubleNullable(json['capacity']),
      status: json['status'] as String,
      isActive: LocationApiModel._parseBool(json['is_active']),
    );

Map<String, dynamic> _$LocationApiModelToJson(LocationApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'warehouse': instance.warehouse,
      'warehouse_name': instance.warehouseName,
      'floor': instance.floor,
      'aisle': instance.aisle,
      'rack': instance.rack,
      'shelf': instance.shelf,
      'position': instance.position,
      'x_coord': instance.xCoord,
      'y_coord': instance.yCoord,
      'capacity': instance.capacity,
      'status': instance.status,
      'is_active': instance.isActive,
    };
