import '../datasources/user_remote_datasource.dart';
import '../models/user_api_models.dart';

/// Repository interface for user operations
abstract class UserRepository {
  Future<UserListResponse> getUsers({int page = 1, int pageSize = 10});
  Future<UserApiModel> getUser(String userId);
  Future<UserApiModel> createUser(UserCreateRequest request);
  Future<UserApiModel> updateUser(String userId, UserUpdateRequest request);
  Future<void> deleteUser(String userId);
}

/// Implementation of user repository
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;

  UserRepositoryImpl({required this.remoteDatasource});

  @override
  Future<UserListResponse> getUsers({int page = 1, int pageSize = 10}) async {
    return await remoteDatasource.getUsers(page: page, pageSize: pageSize);
  }

  @override
  Future<UserApiModel> getUser(String userId) async {
    return await remoteDatasource.getUser(userId);
  }

  @override
  Future<UserApiModel> createUser(UserCreateRequest request) async {
    return await remoteDatasource.createUser(request);
  }

  @override
  Future<UserApiModel> updateUser(
      String userId, UserUpdateRequest request) async {
    return await remoteDatasource.updateUser(userId, request);
  }

  @override
  Future<void> deleteUser(String userId) async {
    return await remoteDatasource.deleteUser(userId);
  }
}
