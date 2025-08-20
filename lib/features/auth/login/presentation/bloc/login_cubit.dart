import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/auth/login/login.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

/// Login cubit
@injectable
class LoginCubit extends Cubit<LoginState> {
  /// Constructor
  LoginCubit(
    this._setAuthStrategy,
    this._loginWithEmailPasswordFirebase,
    this._loginWithEmailPasswordSuperbase,
    this._addNewLog,
  ) : super(LoginState.initial());

  final SetAuthStrategy _setAuthStrategy;
  final LoginWithEmailPasswordFirebase _loginWithEmailPasswordFirebase;
  final LoginWithEmailPasswordSuperbase _loginWithEmailPasswordSuperbase;
  final AddNewLog _addNewLog;

  /// on set authentication platform
  Future<void> onSetAuthenticationStrategy(int index) async {
    final prevStrategy = state.authStrategy;

    emit(state.copyWith(authStrategy: AuthenticationStrategy.values[index]));
    final res = await _setAuthStrategy(AuthenticationStrategy.values[index]);

    if (res.isLeft()) {
      addError(res.asL);
      // revert to previous strategy if setting the new one fails
      emit(state.copyWith(authStrategy: prevStrategy));
      return;
    }
  }

  /// on set email
  void onSetEmail(String email) => emit(state.copyWith(email: EmailAddress(email)));

  /// on set password
  void onSetPassword(String password) => emit(state.copyWith(password: Password(password)));

  /// on submit
  Future<void> onSubmit() async {
    emit(state.copyWith(isProcessing: true));

    // only proceed if both email and password are valid
    if (state.email.isValid && state.password.isValid) {
      final params = LoginWithEmailPasswordParams(email: state.email, password: state.password);

      late final Either<Failure, AuthUser> res;

      switch (state.authStrategy) {
        case AuthenticationStrategy.firebase:
          res = await _loginWithEmailPasswordFirebase(params);
        case AuthenticationStrategy.superbase:
          res = await _loginWithEmailPasswordSuperbase(params);
        case AuthenticationStrategy.restApi:
          // TODO: Handle this case.
          throw UnimplementedError();
        case AuthenticationStrategy.graphql:
          // TODO: Handle this case.
          throw UnimplementedError();
      }

      if (res.isLeft()) addError(res.asL.message);

      // log the result
      final logParams = NewLogParams(
        type: LogType.login,
        method: LogMethod.loginWithEmailPassword,
        parameters: {
          'email': state.email.getOrCrash,
          'authStrategy': state.authStrategy.label,
        },
        message: res.fold(
          (l) => 'Login failed: ${l.message}',
          (r) => 'Login successful for user: ${r.email}',
        ),
      );
      await _addNewLog(logParams);

      emit(state.copyWith(result: res));
    }

    emit(state.copyWith(isProcessing: false));
  }
}
