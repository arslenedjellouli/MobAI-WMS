import 'package:mobile_ai/features/auth/domain/entities/user_entity.dart';
import 'package:mobile_ai/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile_ai/shared/domain/either.dart';
import 'package:mobile_ai/shared/domain/usecase.dart';
import 'package:mobile_ai/core/errors/failures.dart';

/// Use Case: Get currently authenticated user from cache
class GetCurrentUserUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository repository;

  const GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}