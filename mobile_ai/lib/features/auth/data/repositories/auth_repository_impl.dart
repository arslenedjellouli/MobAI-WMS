import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar/isar.dart';

import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/errors/failures.dart';
import 'package:mobile_ai/features/auth/data/datasources/auth_remote_datasource.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCollection>> login(String email, String password);
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
  Future<Either<Failure, UserCollection>> login(String email, String password) async {
    try {
      // 1. Call API
      final result = await remoteDataSource.login(email, password);
      final token = result['access'] as String?; // Adjust based on JWT response
      final userData = result['user'] as Map<String, dynamic>?;

      if (token == null || userData == null) {
        return Left(ServerFailure('Invalid response from server'));
      }

      // 2. Save Token
      await storage.write(key: 'auth_token', value: token);

      // 3. Save User to Isar
      final fullName = (userData['full_name'] as String?)?.trim().isNotEmpty == true
          ? userData['full_name'] as String
          : [userData['first_name'], userData['last_name']]
              .whereType<String>()
              .where((value) => value.trim().isNotEmpty)
              .join(' ')
              .trim();

      final user = UserCollection.create(
        backendId: userData['id']?.toString(),
        email: userData['email'] ?? '',
        fullName: fullName.isEmpty ? 'User' : fullName,
        role: _parseRole(userData['role'] as String?),
        status:
            (userData['is_active'] ?? true) ? UserStatus.active : UserStatus.disabled,
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
      return Left(ServerFailure(e.toString()));
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
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCollection?>> getCurrentUser() async {
    try {
      final isar = db.isar;
      final user = await isar.userCollections.where().findFirst();
      return Right(user);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
  
  UserRole _parseRole(String? role) {
    // Map string to enum
    switch (role?.toUpperCase()) {
      case 'ADMIN':
        return UserRole.admin;
      case 'SUPERVISOR':
        return UserRole.supervisor;
      case 'EMPLOYEE':
      default:
        return UserRole.employee;
    }
  }
}
