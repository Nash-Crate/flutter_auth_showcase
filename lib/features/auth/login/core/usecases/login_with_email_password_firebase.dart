import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Login with email and password use case
@singleton
class LoginWithEmailPasswordFirebase implements Usecase<AuthUser, LoginWithEmailPasswordParams> {
  /// Constructor for the use case
  const LoginWithEmailPasswordFirebase(this._loginRepository);

  final ILoginRepository _loginRepository;

  @override
  Future<Either<Failure, AuthUser>> call(LoginWithEmailPasswordParams params) {
    return _loginRepository.loginWithEmailPasswordFirebase(params);
  }
}
