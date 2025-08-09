import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

/// Splash cubit
@singleton
class AuthenticationCubit extends Cubit<AuthenticationState> {
  /// Constructor
  AuthenticationCubit() : super(const AuthenticationProcessing());

  /// set authenticated user
  void setAuthenticated(AuthUser user) => emit(Authenticated(user));

  /// set unauthenticated error
  void setUnauthenticated(String error) => emit(Unauthenticated(error));

  /// set authentication to processing
  void setProcessing() => emit(const AuthenticationProcessing());
}
