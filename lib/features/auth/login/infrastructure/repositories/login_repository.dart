import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/common/core/entities/auth_user.dart';
import 'package:flutter_auth/features/common/types/typedefs.dart';
import 'package:injectable/injectable.dart';

/// Interface for login repository
@Singleton(as: ILoginRepository)
class LoginRepository implements ILoginRepository {
  /// Constructor for LoginRepository
  const LoginRepository(this._loginDatasource);

  final LoginDatasource _loginDatasource;

  @override
  AsyncFailT<AuthUser> loginWithEmailPasswordFirebase(LoginWithEmailPasswordParams params) {
    return _loginDatasource.loginWithEmailPasswordFirebase(params);
  }
}
