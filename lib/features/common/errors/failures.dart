import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base class for all [Failure]s
@freezed
abstract class Failure with _$Failure {
  /// Default constructor
  const factory Failure([@Default('An unexpected error occurred') String message]) = _Failure;
}
