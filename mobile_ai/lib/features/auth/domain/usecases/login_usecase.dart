import 'package:mobile_ai/features/auth/domain/entities/user_entity.dart';
import 'package:mobile_ai/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile_ai/shared/domain/either.dart';
import 'package:mobile_ai/shared/domain/usecase.dart';
import 'package:mobile_ai/core/errors/failures.dart';

/// Use Case: Authenticate user with credentials
class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    // Input validation
    if (params.email.isEmpty) {
      return const Left(ValidationFailure('Email is required'));
    }

    if (params.password.isEmpty) {
      return const Left(ValidationFailure('Password is required'));
    }

    if (!_isValidEmail(params.email)) {
      return const Left(ValidationFailure('Invalid email format'));
    }

    // Delegate to repository
    return await repository.login(
      email: params.email,
      password: params.password,
      rememberMe: params.rememberMe,
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

class LoginParams {
  final String email;
  final String password;
  final bool rememberMe;

  const LoginParams({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });
}