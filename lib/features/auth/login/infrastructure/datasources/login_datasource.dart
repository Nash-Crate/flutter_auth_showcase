import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_showcase/features/auth/login/login.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/// Abstraction for the Login Data Source.
abstract class LoginRemoteDatasource with ILoginRepository {}

/// Implementation of the Login Data Source.
@Singleton(as: LoginRemoteDatasource)
class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  /// Constructor
  const LoginRemoteDatasourceImpl(this._firebaseAuth);

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  AsyncFailT<AuthUser> loginWithEmailPasswordFirebase(LoginWithEmailPasswordParams params) async {
    try {
      // Sign out any existing user before signing in
      await _firebaseAuth.signOut();

      final res = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email.getOrCrash,
        password: params.password.getOrCrash,
      );
      final user = res.user;
      if (user == null) return const Left(Failure('User not found'));

      final authUser = AuthUser(
        id: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
      );

      return Right(authUser);
    } on firebase_auth.FirebaseAuthException catch (e) {
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

  @override
  AsyncFailT<AuthUser> loginWithEmailPasswordSuperbase(LoginWithEmailPasswordParams params) async {
    try {
      final supabaseClient = supabase.Supabase.instance.client;

      final res = await supabaseClient.auth.signInWithPassword(
        email: params.email.getOrCrash,
        password: params.password.getOrCrash,
      );

      final user = res.user;
      final session = res.session;
      if (user == null || session == null) return const Left(Failure('User not found'));

      final authUser = AuthUser(
        id: user.id,
        email: user.email ?? '',
        name: '',
        // token: session.accessToken,
        // refreshToken: session.refreshToken ?? '',
      );

      return Right(authUser);
    } on supabase.AuthException catch (e) {
      if (e.code == 'invalid_credentials') {
        return const Left(Failure('No user found for that email.'));
      } else if (e.code == 'email_not_confirmed') {
        return const Left(Failure('Email not confirmed.'));
      }
      return Left(Failure('An error occurred: ${e.message}'));
    } on Exception catch (e) {
      return Left(Failure('An error occurred: $e'));
    }
  }
}
