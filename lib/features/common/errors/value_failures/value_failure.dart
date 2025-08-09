import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

/// Base class for all [ValueFailure]s
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  /// Email failures
  const factory ValueFailure.invalidEmailAddress({required T failedValue}) = InvalidEmailAddress;

  /// Password failures
  const factory ValueFailure.invalidPassword({required T failedValue}) = InvalidPassword;
}
