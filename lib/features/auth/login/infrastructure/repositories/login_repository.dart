import 'package:flutter_showcase/features/auth/login/login.dart';
import 'package:flutter_showcase/features/common/core/entities/auth_user.dart';
import 'package:flutter_showcase/features/common/types/typedefs.dart';
import 'package:injectable/injectable.dart';

/// Interface for login repository
@Singleton(as: ILoginRepository)
class LoginRepository implements ILoginRepository {
  /// Constructor for LoginRepository
  const LoginRepository(this._remoteDatasource);

  final LoginRemoteDatasource _remoteDatasource;

  @override
  AsyncFailT<AuthUser> loginWithEmailPasswordFirebase(LoginWithEmailPasswordParams params) {
    return _remoteDatasource.loginWithEmailPasswordFirebase(params);
  }

  @override
  AsyncFailT<AuthUser> loginWithEmailPasswordSuperbase(LoginWithEmailPasswordParams params) {
    return _remoteDatasource.loginWithEmailPasswordSuperbase(params);
  }
}
