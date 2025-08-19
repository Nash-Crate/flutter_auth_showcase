import 'package:flutter_showcase/features/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_email_password_params.freezed.dart';

/// parameters for the register with email and password use case
@freezed
abstract class RegisterWithEmailPasswordParams with _$RegisterWithEmailPasswordParams {
  /// Constructor for the parameters
  const factory RegisterWithEmailPasswordParams({
    required EmailAddress email,
    required Password password,
  }) = _RegisterWithEmailPasswordParams;
}
