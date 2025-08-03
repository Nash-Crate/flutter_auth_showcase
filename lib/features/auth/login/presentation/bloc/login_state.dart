part of 'login_cubit.dart';

/// Login platform enum
enum LoginPlatform {
  /// Firebase login
  firebase,

  /// Superbase login
  superbase,

  /// Rest API login
  restApi,

  /// GraphQL login
  graphql,
}

/// Login state
@freezed
abstract class LoginState with _$LoginState {
  /// constructor
  const factory LoginState({
    required EmailAddress email,
    required Password password,
    @Default(false) bool isProcessing,
    Either<Failure, AuthUser>? result,

    @Default(LoginPlatform.firebase) LoginPlatform loginPlatform,
  }) = _LoginState;

  /// Initial state
  factory LoginState.initial() => LoginState(
    email: EmailAddress(null),
    password: Password(null),
  );

  const LoginState._();

  /// check if the login is successful
  AuthUser? get user => result?.fold((l) => null, (r) => r);
}
