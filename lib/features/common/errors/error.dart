import 'package:flutter_showcase/features/common/errors/errors.dart';

/// Centralized [UnexpectedValueError] class
class UnexpectedValueError<T> extends Error {
  /// [UnexpectedValueError] constructor
  UnexpectedValueError(this.valueFailure);

  /// [valueFailure]
  final ValueFailure<T> valueFailure;

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was : $valueFailure');
  }
}

/// Centralized [ConnectionFailureError] class
class ConnectionFailureError extends Error {
  @override
  String toString() => 'Failed to connect to the server';
}

/// Centralized [ValidationFailureError] class
class ValidationFailureError extends Error {
  /// [ValidationFailureError] constructor with a validation failed message
  ValidationFailureError(this.message);

  /// validation failed message
  final String message;
}
