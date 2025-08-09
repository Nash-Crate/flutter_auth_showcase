part of 'home_cubit.dart';

/// Home state
@freezed
abstract class HomeState with _$HomeState {
  /// constructor
  const factory HomeState({
    @Default(true) bool processing,
    Either<Failure, Unit>? logoutResult,
  }) = _HomeState;

  /// Initial state
  factory HomeState.initial() => const HomeState();

  const HomeState._();

  /// Check if the user is logged out
  bool get isLoggedOut => logoutResult?.isRight() ?? false;
}
