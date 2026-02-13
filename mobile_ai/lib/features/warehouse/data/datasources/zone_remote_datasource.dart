import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../models/zone_api_models.dart';

abstract class ZoneRemoteDatasource {
  Future<List<ZoneApiModel>> getZones({String? warehouseId});
  Future<ZoneApiModel> createZone({
    required String warehouseId,
    required String code,
    required String name,
    required String zoneType,
  });
}

class ZoneRemoteDatasourceImpl implements ZoneRemoteDatasource {
  final ApiClient apiClient;

  ZoneRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<List<ZoneApiModel>> getZones({String? warehouseId}) async {
    try {
      final response = await apiClient.get(
        '/v1/zones/',
        queryParameters: {
          if (warehouseId != null) 'warehouse_id': warehouseId,
        },
      );

      final data = response.data;
      List<ZoneApiModel> zones = [];
      if (data is Map<String, dynamic> && data.containsKey('results')) {
        final results = data['results'] as List;
        zones = results.map((json) => ZoneApiModel.fromJson(json)).toList();
      } else if (data is List) {
        zones = data.map((json) => ZoneApiModel.fromJson(json)).toList();
      }

      if (warehouseId != null) {
        zones = zones.where((zone) => zone.warehouse == warehouseId).toList();
      }

      return zones;
    } on DioException catch (e) {
      throw Exception('Failed to fetch zones: ${e.message}');
    }
  }

  @override
  Future<ZoneApiModel> createZone({
    required String warehouseId,
    required String code,
    required String name,
    required String zoneType,
  }) async {
    try {
      final response = await apiClient.post(
        '/v1/zones/',
        data: {
          'warehouse': warehouseId,
          'code': code,
          'name': name,
          'zone_type': zoneType,
          'status': 'ACTIVE',
        },
      );
      return ZoneApiModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to create zone: ${e.message}');
    }
  }
}
