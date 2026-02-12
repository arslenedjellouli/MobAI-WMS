import 'package:mobile_ai/shared/domain/either.dart';
import 'package:mobile_ai/core/errors/failures.dart';

/// Base interface for use cases
/// Type parameters:
///   Type: Return type
///   Params: Input parameters type
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use this when use case doesn't need parameters
class NoParams {
  const NoParams();
}

/// Base class for paginated use cases
abstract class PaginatedUseCase<Type, Params> {
  Future<Either<Failure, PaginatedResult<Type>>> call(Params params);
}

/// Result wrapper for paginated data
class PaginatedResult<T> {
  final List<T> data;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasMore;

  const PaginatedResult({
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasMore,
  });
}