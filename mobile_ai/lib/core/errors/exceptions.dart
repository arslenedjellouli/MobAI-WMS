/// Base exception class
class AppException implements Exception {
  final String message;
  final int? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => 'AppException: $message (code: $code)';
}

/// Server/API exceptions
class ServerException extends AppException {
  const ServerException(super.message, {super.code});
}

/// Network exceptions
class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection']);
}

/// Cache exceptions
class CacheException extends AppException {
  const CacheException(super.message);
}

/// Validation exceptions
class ValidationException extends AppException {
  const ValidationException(super.message);
}

/// Authentication exceptions
class AuthException extends AppException {
  const AuthException(super.message, {super.code});
}

/// Not found exceptions
class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Resource not found']);
}

/// Conflict exceptions (optimistic locking)
class ConflictException extends AppException {
  const ConflictException([String message = 'Data conflict detected', int? code])
      : super(message, code: code);
}

/// Timeout exceptions
class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Request timeout']);
}