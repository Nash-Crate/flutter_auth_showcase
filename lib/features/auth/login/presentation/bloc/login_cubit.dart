import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

/// Login cubit
@injectable
class LoginCubit extends Cubit<LoginState> {
  /// Constructor
  LoginCubit(this._loginWithEmailPasswordFirebase) : super(LoginState.initial());

  final LoginWithEmailPasswordFirebase _loginWithEmailPasswordFirebase;

  /// on set email
  void onSetEmail(String email) => emit(state.copyWith(email: EmailAddress(email)));

  /// on set password
  void onSetPassword(String password) => emit(state.copyWith(password: Password(password)));

  /// on submit
  Future<void> onSubmit() async {
    emit(state.copyWith(isProcessing: true));

    // only proceed if both email and password are valid
    if (state.email.isValid && state.password.isValid) {
      final params = LoginWithEmailPasswordParams(
        email: state.email,
        password: state.password,
      );

      late final Either<Failure, AuthUser> res;

      switch (state.loginPlatform) {
        case LoginPlatform.firebase:
          res = await _loginWithEmailPasswordFirebase(params);
        case LoginPlatform.superbase:
          // TODO: Handle this case.
          throw UnimplementedError();
        case LoginPlatform.restApi:
          // TODO: Handle this case.
          throw UnimplementedError();
        case LoginPlatform.graphql:
          // TODO: Handle this case.
          throw UnimplementedError();
      }

      // if (res.isLeft()) addError(res.getLeft());
      emit(state.copyWith(result: res));
    }

    emit(state.copyWith(isProcessing: false));
  }
}
