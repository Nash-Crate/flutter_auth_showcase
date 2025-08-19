part of 'login_cubit.dart';

/// Login state
@freezed
abstract class LoginState with _$LoginState {
  /// constructor
  const factory LoginState({
    required EmailAddress email,
    required Password password,
    @Default(false) bool isProcessing,
    Either<Failure, AuthUser>? result,

    @Default(AuthenticationStrategy.firebase) AuthenticationStrategy authStrategy,
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
