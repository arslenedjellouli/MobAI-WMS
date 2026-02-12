/// Base failure class
abstract class Failure {
  final String message;
  final int? code;

  const Failure(this.message, {this.code});

  @override
  bool operator ==(Object other) {
    return other is Failure && other.message == message && other.code == code;
  }

  @override
  int get hashCode => message.hashCode ^ code.hashCode;

  @override
  String toString() => 'Failure: $message (code: $code)';
}

/// Server/API related failures
class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}

/// Network connectivity failures
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

/// Cache/Local storage failures
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Validation failures
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Authentication failures
class AuthFailure extends Failure {
  const AuthFailure(super.message, {super.code});
}

/// Permission/Authorization failures
class PermissionFailure extends Failure {
  const PermissionFailure([String message = 'Insufficient permissions', int? code])
      : super(message, code: code);
}

/// Not found failures
class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Resource not found']);
}

/// Conflict failures (e.g., optimistic locking)
class ConflictFailure extends Failure {
  const ConflictFailure([String message = 'Data conflict detected', int? code])
      : super(message, code: code);
}

/// Business logic failures
class BusinessFailure extends Failure {
  const BusinessFailure(super.message);
}

/// Unknown/Unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred']);
}