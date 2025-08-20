import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Implementation of the authentication repository
@Singleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  /// Constructor
  const AuthRepository(this._localDatasource);

  final AuthLocalDatasource _localDatasource;

  @override
  AsyncFailT<AuthUser?> getCachedAuth() {
    return _localDatasource.getCachedAuth();
  }

  @override
  AsyncFailT<Unit> signOut() {
    return _localDatasource.signOut();
  }
}
