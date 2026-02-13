import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../models/chariot_api_models.dart';

/// Remote datasource for chariot operations
abstract class ChariotRemoteDatasource {
  Future<ChariotListResponse> getChariots({int page = 1, int pageSize = 10});
  Future<ChariotApiModel> getChariot(String chariotId);
  Future<ChariotApiModel> createChariot(ChariotCreateRequest request);
  Future<ChariotApiModel> updateChariot(
      String chariotId, ChariotUpdateRequest request);
  Future<void> deleteChariot(String chariotId);
}

class ChariotRemoteDatasourceImpl implements ChariotRemoteDatasource {
  final ApiClient apiClient;

  ChariotRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<ChariotListResponse> getChariots(
      {int page = 1, int pageSize = 10}) async {
    try {
      final response = await apiClient.get(
        '/v1/operations/chariots/',
        queryParameters: {
          'page': page,
          'page_size': pageSize,
        },
      );

      return ChariotListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch chariots: ${e.message}');
    }
  }

  @override
  Future<ChariotApiModel> getChariot(String chariotId) async {
    try {
      final response = await apiClient.get('/v1/operations/chariots/$chariotId/');
      return ChariotApiModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch chariot details: ${e.message}');
    }
  }

  @override
  Future<ChariotApiModel> createChariot(ChariotCreateRequest request) async {
    try {
      final response =
          await apiClient.post('/v1/operations/chariots/', data: request.toJson());
      return ChariotApiModel.fromJson(response.data);
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
      throw Exception('Failed to create chariot: ${e.message}');
    }
  }

  @override
  Future<ChariotApiModel> updateChariot(
      String chariotId, ChariotUpdateRequest request) async {
    try {
        final response = await apiClient.patch(
          '/v1/operations/chariots/$chariotId/',
          data: request.toJson());
      return ChariotApiModel.fromJson(response.data);
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
      throw Exception('Failed to update chariot: ${e.message}');
    }
  }

  @override
  Future<void> deleteChariot(String chariotId) async {
    try {
      await apiClient.delete('/v1/operations/chariots/$chariotId/');
    } on DioException catch (e) {
      throw Exception('Failed to delete chariot: ${e.message}');
    }
  }
}
