import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Abstraction for the Login Data Source.
abstract class LoginDatasource with ILoginRepository {}

/// Implementation of the Login Data Source.
@Singleton(as: LoginDatasource)
class LoginDatasourceImpl implements LoginDatasource {
  @override
  AsyncFailT<AuthUser> loginWithEmailPasswordFirebase(LoginWithEmailPasswordParams params) async {
    try {
      // Sign out any existing user before signing in
      await FirebaseAuth.instance.signOut();

      final res = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: params.email.getOrCrash,
        password: params.password.getOrCrash,
      );
      final user = res.user;
      if (user == null) return const Left(Failure('User not found'));

      final authUser = AuthUser(
        id: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
        token: user.refreshToken ?? '',
        refreshToken: user.refreshToken ?? '',
      );

      return Right(authUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(Failure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return const Left(Failure('Wrong password provided for that user.'));
      }
      return Left(Failure('An error occurred: $e'));
    } on Exception catch (e) {
      return Left(Failure('An error occurred: $e'));
    }
  }
}
