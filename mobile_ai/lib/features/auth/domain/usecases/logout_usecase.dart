import 'package:mobile_ai/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile_ai/shared/domain/either.dart';
import 'package:mobile_ai/shared/domain/usecase.dart';
import 'package:mobile_ai/core/errors/failures.dart';

/// Use Case: Logout current user
class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  const LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.logout();
  }
}