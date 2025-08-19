import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/auth/register/register.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

/// Cubit for Register
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  /// Constructor
  RegisterCubit(
    this._setAuthStrategy,
    this._registerWithEmailPasswordFirebase,
    this._registerWithEmailPasswordSuperbase,
    this._addNewLog,
  ) : super(RegisterState.initial());

  final SetAuthStrategy _setAuthStrategy;
  final RegisterWithEmailPasswordFirebase _registerWithEmailPasswordFirebase;
  final RegisterWithEmailPasswordSuperbase _registerWithEmailPasswordSuperbase;
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
  void onSetPassword(String password) => emit(
    state.copyWith(password: Password(password, confirmPassword: state.confirmPassword.getOrNull)),
  );

  /// on set confirm password
  void onSetConfirmPassword(String confirmPassword) => emit(
    state.copyWith(
      confirmPassword: ConfirmPassword(confirmPassword, password: state.password.getOrNull),
    ),
  );

  /// on submit
  Future<void> onSubmit() async {
    emit(state.copyWith(isProcessing: true));

    // only proceed if both email and password are valid
    if (state.email.isValid && state.password.isValid) {
      final params = RegisterWithEmailPasswordParams(email: state.email, password: state.password);

      late final Either<Failure, Unit> res;

      switch (state.authStrategy) {
        case AuthenticationStrategy.firebase:
          res = await _registerWithEmailPasswordFirebase(params);
        case AuthenticationStrategy.superbase:
          res = await _registerWithEmailPasswordSuperbase(params);
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
        type: LogType.register,
        method: LogMethod.registerWithEmailPassword,
        parameters: {
          'email': state.email.getOrCrash,
          'authStrategy': state.authStrategy.label,
        },
        message: res.fold(
          (l) => 'Registration failed: ${l.message}',
          (r) => 'Registration is successful for user: ${state.email.getOrCrash}',
        ),
      );
      await _addNewLog(logParams);

      emit(state.copyWith(result: res));
    }

    emit(state.copyWith(isProcessing: false));
  }
}
