part of 'splash_cubit.dart';

/// Splash state
@freezed
abstract class SplashState with _$SplashState {
  /// state constructor
  const factory SplashState({
    @Default(false) bool isProcessing,
    Either<String, AuthUser?>? result,
  }) = _SplashState;

  /// Initial state
  factory SplashState.initial() => const SplashState();

  const SplashState._();

  /// check authentication status
  bool get isAuthenticated => result?.isRight() != null && result!.asR != null;

  /// check if the login is successful
  AuthUser? get user => result?.fold((l) => null, (r) => r);
}
