import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

/// Splash cubit
@injectable
class SplashCubit extends Cubit<SplashState> {
  /// Constructor
  SplashCubit(this._getAuthStrategy, this._setAuthStrategy) : super(SplashState.initial()) {
    init();
  }

  final GetAuthStrategy _getAuthStrategy;
  final SetAuthStrategy _setAuthStrategy;

  /// Initialize splash functions
  Future<void> init() async {
    emit(state.copyWith(isProcessing: true));

    await Future.wait([
      checkAuthenticationStatus(),
      getSetAuthStrategy(),
    ]);

    emit(state.copyWith(isProcessing: false));
  }

  /// check authentication status
  Future<void> checkAuthenticationStatus() async {
    late final Either<String, AuthUser> result;

    // Simulate a login process
    await Future<void>.delayed(const Duration(milliseconds: 500));

    result = const Left('No user found');

    // For now, we just simulate a successful auth user found
    emit(state.copyWith(result: result));
  }

  /// Get authentication strategy and set it if not already set
  Future<void> getSetAuthStrategy() async {
    final strategy = await _getAuthStrategy();

    if (strategy.isLeft()) {
      final res = await _setAuthStrategy(AuthenticationStrategy.firebase);
      if (res.isLeft()) {
        addError(res.asL);
      }
    }

    // emit(state.copyWith( authStrategy: strategy.asR));
  }
}
