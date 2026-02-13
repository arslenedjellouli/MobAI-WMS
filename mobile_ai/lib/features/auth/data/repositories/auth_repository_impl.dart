import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar/isar.dart';

import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCollection>> login(String username, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserCollection?>> getCurrentUser();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final IsarDatabase db;
  final FlutterSecureStorage storage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.db,
    required this.storage,
  });

  @override
  Future<Either<Failure, UserCollection>> login(String username, String password) async {
    try {
      // 1. Call API
      final result = await remoteDataSource.login(username, password);
      final token = result['access'] as String?; // Adjust based on JWT response
      final userData = result['user'] as Map<String, dynamic>?;

      if (token == null || userData == null) {
        return Left(ServerFailure(message: 'Invalid response from server'));
      }

      // 2. Save Token
      await storage.write(key: 'auth_token', value: token);

      // 3. Save User to Isar
      final user = UserCollection.create(
        backendId: userData['id']?.toString(), // Ensure String
        email: userData['email'] ?? '',
        username: userData['username'] ?? '',
        firstName: userData['first_name'],
        lastName: userData['last_name'],
        role: _parseRole(userData['role']),
        isActive: userData['is_active'] ?? true,
        createdAt: DateTime.now(),
      );

      final isar = db.isar;
      await isar.writeTxn(() async {
        // Clear old users to ensure single user session if needed
        await isar.userCollections.clear(); 
        await isar.userCollections.put(user);
      });

      return Right(user);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await storage.delete(key: 'auth_token');
      final isar = db.isar;
      await isar.writeTxn(() async {
        await isar.userCollections.clear();
      });
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCollection?>> getCurrentUser() async {
    try {
      final isar = db.isar;
      final user = await isar.userCollections.where().findFirst();
      return Right(user);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
  
  UserRole _parseRole(String? role) {
    // Map string to enum
    switch (role?.toUpperCase()) {
      case 'ADMIN': return UserRole.admin;
      case 'MANAGER': return UserRole.manager;
      case 'OPERATOR': return UserRole.operator;
      default: return UserRole.operator;
    }
  }
}
