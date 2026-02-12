/// Functional error handling
/// Either<L, R> represents a value that can be Left (error) or Right (success)
abstract class Either<L, R> {
  const Either();

  /// Fold the Either into a single value
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight);

  /// Check if this is a Right value
  bool get isRight;

  /// Check if this is a Left value
  bool get isLeft;
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    return onLeft(value);
  }

  @override
  bool get isRight => false;

  @override
  bool get isLeft => true;

  @override
  bool operator ==(Object other) {
    return other is Left && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    return onRight(value);
  }

  @override
  bool get isRight => true;

  @override
  bool get isLeft => false;

  @override
  bool operator ==(Object other) {
    return other is Right && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}