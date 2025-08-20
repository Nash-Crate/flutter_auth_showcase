import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Interface for the authentication local datasource
abstract class AuthLocalDatasource with IAuthRepository {}

/// Implementation of the authentication local datasource
@Singleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  /// Constructor
  const AuthLocalDatasourceImpl(this._firebaseAuth);

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  AsyncFailT<AuthUser?> getCachedAuth() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        final authUser = AuthUser(
          id: user.uid,
          email: user.email ?? '',
          name: user.displayName ?? '',
        );

        return Right(authUser);
      }
      return const Right(null);
    } on Exception catch (e) {
      return Left(Failure('An error occurred: $e'));
    }
  }

  @override
  AsyncFailT<Unit> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(unit);
    } on Exception catch (e) {
      return Left(Failure('An error occurred while signing out: $e'));
    }
  }
}
