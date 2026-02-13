import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../models/user_api_models.dart';

/// Remote datasource for user operations
abstract class UserRemoteDatasource {
  Future<UserListResponse> getUsers({int page = 1, int pageSize = 10});
  Future<UserApiModel> getUser(String userId);
  Future<UserApiModel> createUser(UserCreateRequest request);
  Future<UserApiModel> updateUser(String userId, UserUpdateRequest request);
  Future<void> deleteUser(String userId);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final ApiClient apiClient;

  UserRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<UserListResponse> getUsers({int page = 1, int pageSize = 10}) async {
    try {
      final response = await apiClient.get(
        '/v1/users/',
        queryParameters: {
          'page': page,
          'page_size': pageSize,
        },
      );

      return UserListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch users: ${e.message}');
    }
  }

  @override
  Future<UserApiModel> getUser(String userId) async {
    try {
      final response = await apiClient.get('/v1/users/$userId/');
      return UserApiModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch user details: ${e.message}');
    }
  }

  @override
  Future<UserApiModel> createUser(UserCreateRequest request) async {
    try {
      final response = await apiClient.post('/v1/users/', data: request.toJson());
      return UserApiModel.fromJson(response.data);
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
      throw Exception('Failed to create user: ${e.message}');
    }
  }

  @override
  Future<UserApiModel> updateUser(
      String userId, UserUpdateRequest request) async {
    try {
      final response = await apiClient.patch(
        '/v1/users/$userId/',
        data: request.toJson(),
      );
      return UserApiModel.fromJson(response.data);
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
      throw Exception('Failed to update user: ${e.message}');
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    try {
      await apiClient.delete('/v1/users/$userId/');
    } on DioException catch (e) {
      throw Exception('Failed to delete user: ${e.message}');
    }
  }
}
