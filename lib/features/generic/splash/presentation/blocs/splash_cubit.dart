import 'package:flutter_auth/features/common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

/// Splash cubit
@injectable
class SplashCubit extends Cubit<SplashState> {
  /// Constructor
  SplashCubit() : super(SplashState.initial()) {
    checkAuthenticationStatus();
  }

  /// check authentication status
  Future<void> checkAuthenticationStatus() async {
    emit(state.copyWith(isProcessing: true));

    late final Either<String, AuthUser> result;

    // Simulate a login process
    await Future<void>.delayed(const Duration(milliseconds: 500));

    result = const Left('No user found');

    // For now, we just simulate a successful auth user found
    emit(state.copyWith(isProcessing: false, result: result));
  }
}
