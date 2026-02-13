import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../models/location_api_models.dart';

/// Remote datasource for location operations
abstract class LocationRemoteDatasource {
  Future<List<LocationApiModel>> getLocations({String? warehouseId});
  Future<List<LocationApiModel>> getAvailableLocations({String? warehouseId});
  Future<LocationApiModel> getLocation(String locationId);
  Future<LocationApiModel> createLocation(Map<String, dynamic> data);
}

class LocationRemoteDatasourceImpl implements LocationRemoteDatasource {
  final ApiClient apiClient;

  LocationRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<List<LocationApiModel>> getLocations({String? warehouseId}) async {
    try {
      final response = await apiClient.get(
        '/v1/locations/',
        queryParameters: {
          'page_size': 1000,
          if (warehouseId != null) 'warehouse_id': warehouseId,
        },
      );

      final data = response.data;
      if (data is Map<String, dynamic> && data.containsKey('results')) {
        final results = data['results'] as List;
        return results
            .map((json) => LocationApiModel.fromJson(json))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw Exception('Failed to fetch locations: ${e.message}');
    }
  }

  @override
  Future<List<LocationApiModel>> getAvailableLocations(
      {String? warehouseId}) async {
    try {
      final response = await apiClient.get(
        '/v1/locations/available/',
        queryParameters: {
          if (warehouseId != null) 'warehouse_id': warehouseId,
        },
      );

      final data = response.data;
      if (data is List) {
        return data
            .map((json) => LocationApiModel.fromJson(json))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw Exception('Failed to fetch available locations: ${e.message}');
    }
  }

  @override
  Future<LocationApiModel> getLocation(String locationId) async {
    try {
      final response = await apiClient.get('/v1/locations/$locationId/');
      return LocationApiModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch location: ${e.message}');
    }
  }

  @override
  Future<LocationApiModel> createLocation(Map<String, dynamic> data) async {
    try {
      final response = await apiClient.post('/v1/locations/', data: data);
      return LocationApiModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final errors = e.response?.data;
        if (errors is Map) {
          final errorMessages = errors.entries
              .map((entry) => '${entry.key}: ${entry.value}')
              .join(', ');
          throw Exception('Validation error: $errorMessages');
        }
      }
      throw Exception('Failed to create location: ${e.message}');
    }
  }
}
