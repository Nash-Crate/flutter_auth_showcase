part of 'authentication_cubit.dart';

/// Authentication state
@freezed
class AuthenticationState with _$AuthenticationState {
  /// Authentication processing
  const factory AuthenticationState.processing() = AuthenticationProcessing;

  /// Authenticated
  const factory AuthenticationState.authenticated(AuthUser user) = Authenticated;

  /// Unauthenticated
  const factory AuthenticationState.unauthenticated(String error) = Unauthenticated;
}
