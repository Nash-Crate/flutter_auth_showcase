import 'package:flutter_showcase/features/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_email_password_params.freezed.dart';

/// parameters for the login with email and password use case
@freezed
abstract class LoginWithEmailPasswordParams with _$LoginWithEmailPasswordParams {
  /// Constructor for the parameters
  const factory LoginWithEmailPasswordParams({
    required EmailAddress email,
    required Password password,
  }) = _LoginWithEmailPasswordParams;
}
