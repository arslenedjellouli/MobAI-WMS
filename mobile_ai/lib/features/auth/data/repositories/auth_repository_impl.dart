import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar/isar.dart';

import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/errors/failures.dart';
import 'package:mobile_ai/features/auth/data/datasources/auth_remote_datasource.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCollection>> login(String email, String password, {bool rememberMe = false});
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
  Future<Either<Failure, UserCollection>> login(String email, String password, {bool rememberMe = false}) async {
    try {
      print('🔐 [AuthRepository] Starting login for: $email (Remember Me: $rememberMe)');
      
      // 1. Call API
      final result = await remoteDataSource.login(email, password);
      print('📡 [AuthRepository] API Response received: ${result.keys}');
      
      final token = result['access'] as String?;
      final refreshToken = result['refresh'] as String?;
      final userData = result['user'] as Map<String, dynamic>?;

      print('🔑 [AuthRepository] Token received: ${token?.substring(0, 20)}...');
      print('👤 [AuthRepository] User data: ${userData?['email']}');

      if (token == null || userData == null) {
        print('❌ [AuthRepository] Missing token or user data in response');
        return Left(ServerFailure('Invalid response from server'));
      }

      // 2. Always save Access Token to SecureStorage for current session
      // This ensures API calls (like sync) work during the active session
      try {
        await storage.write(key: 'auth_token', value: token);
        if (refreshToken != null) {
          await storage.write(key: 'refresh_token', value: refreshToken);
        }
        print('✅ [AuthRepository] Tokens saved to SecureStorage for current session');
        
        // If rememberMe is false, mark tokens as session-only
        if (!rememberMe) {
          await storage.write(key: 'session_only', value: 'true');
          print('🔒 [AuthRepository] Session marked as non-persistent (Remember Me: disabled)');
        } else {
          await storage.delete(key: 'session_only');
          print('🔓 [AuthRepository] Session marked as persistent (Remember Me: enabled)');
        }
      } catch (e) {
        print('⚠️ [AuthRepository] Failed to save tokens to SecureStorage: $e');
      }

      // 3. Create and Save User to Isar
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
        accessToken: token,
        refreshToken: refreshToken,
        createdAt: DateTime.now(),
      );

      print('👥 [AuthRepository] Created UserCollection object: ${user.fullName} (${user.email})');
      print('   - ID: ${user.id}');
      print('   - Role: ${user.role}');
      print('   - Status: ${user.status}');

      // Ensure Isar is initialized
      try {
        final isar = db.isar;
        print('📦 [AuthRepository] Isar database is initialized');
        
        // Save user to Isar
        await isar.writeTxn(() async {
          print('📝 [AuthRepository] Starting transaction - clearing old user data...');
          final oldCount = await isar.userCollections.count();
          print('   Old users in database: $oldCount');
          
          await isar.userCollections.clear(); 
          print('✅ [AuthRepository] Old user data cleared');
          
          print('💾 [AuthRepository] Saving new user to Isar...');
          await isar.userCollections.put(user);
          print('✅ [AuthRepository] User saved to Isar (put operation completed)');
        });

        // Verify user was saved
        final users = await isar.userCollections.buildQuery().findAll();
        print('🔍 [AuthRepository] Verification - Total users in Isar: ${users.length}');
        
        if (users.isNotEmpty) {
          final savedUser = users.first;
          print('🔍 [AuthRepository] First user in database:');
          print('   - Full Name: ${savedUser.fullName}');
          print('   - Email: ${savedUser.email}');
          print('   - Backend ID: ${savedUser.backendId}');
        } else {
          print('⚠️ [AuthRepository] No users found in Isar after save!');
        }

      } catch (e, st) {
        print('❌ [AuthRepository] Isar database error: $e');
        print('📋 Stack trace: $st');
        return Left(ServerFailure('Failed to save user data: $e'));
      }

      print('✨ [AuthRepository] Login completed successfully');
      return Right(user);
    } catch (e, st) {
      print('❌ [AuthRepository] Login error: $e');
      print('📋 Stack trace: $st');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // Stop background sync service (if it was started)
      // try {
      //   GetIt.I<PeriodicSyncService>().stop();
      // } catch (e) {
      //   // Ignore if sync service not initialized
      // }

      // Clear all tokens from secure storage
      await storage.delete(key: 'auth_token');
      await storage.delete(key: 'refresh_token');
      await storage.delete(key: 'session_only');
      print('🔓 [AuthRepository] Tokens and session flags cleared from SecureStorage');
      
      // Clear user data from Isar
      final isar = db.isar;
      await isar.writeTxn(() async {
        await isar.userCollections.clear();
      });
      print('🗑️ [AuthRepository] User data cleared from Isar');
      
      return const Right(null);
    } catch (e) {
      print('❌ [AuthRepository] Logout error: $e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCollection?>> getCurrentUser() async {
    try {
      final isar = db.isar;
      final users = await isar.userCollections.buildQuery().findAll();
      final user = users.isNotEmpty ? users.first : null;
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
