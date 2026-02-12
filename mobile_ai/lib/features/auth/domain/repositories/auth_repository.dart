import 'package:mobile_ai/features/auth/domain/entities/user_entity.dart';
import 'package:mobile_ai/shared/domain/either.dart';
import 'package:mobile_ai/core/errors/failures.dart';

/// Authentication repository interface
/// Defines contract for authentication operations
/// Implementation in data layer
abstract class AuthRepository {
  /// Login with email and password
  /// Returns Either<Failure, UserEntity>
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
    bool rememberMe = false,
  });

  /// Logout current user
  Future<Either<Failure, void>> logout();

  /// Get currently authenticated user from cache
  Future<Either<Failure, UserEntity>> getCurrentUser();

  /// Refresh access token using refresh token
  Future<Either<Failure, UserEntity>> refreshToken();

  /// Check if user is authenticated
  Future<bool> isAuthenticated();

  /// Get stored tokens
  Future<Map<String, String>?> getTokens();

  /// Clear all authentication data
  Future<void> clearAuthData();
}