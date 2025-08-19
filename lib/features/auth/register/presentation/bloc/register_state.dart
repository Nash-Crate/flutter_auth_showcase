part of 'register_cubit.dart';

/// Cubit state for Register
@freezed
abstract class RegisterState with _$RegisterState {
  /// constructor
  const factory RegisterState({
    required EmailAddress email,
    required Password password,
    required ConfirmPassword confirmPassword,
    @Default(false) bool isProcessing,
    Either<Failure, Unit>? result,

    @Default(AuthenticationStrategy.firebase) AuthenticationStrategy authStrategy,
  }) = _RegisterState;

  /// Initial state
  factory RegisterState.initial() => RegisterState(
    email: EmailAddress(null),
    password: Password(null),
    confirmPassword: ConfirmPassword(null, password: null),
  );

  const RegisterState._();

  /// check if the register is successful
  bool get success => result?.fold((l) => false, (r) => true) ?? false;
}
