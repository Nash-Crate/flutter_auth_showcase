import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_showcase/features/auth/register/register.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/// Abstraction for the Register Data Source.
abstract class RegisterDatasource with IRegisterRepository {}

/// Implementation of the Register Data Source.
@Singleton(as: RegisterDatasource)
class RegisterDatasourceImpl implements RegisterDatasource {
  @override
  AsyncFailT<Unit> registerWithEmailPasswordFirebase(
    RegisterWithEmailPasswordParams params,
  ) async {
    try {
      // Sign out any existing user before signing in
      await firebase_auth.FirebaseAuth.instance.signOut();

      await firebase_auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: params.email.getOrCrash,
        password: params.password.getOrCrash,
      );

      return const Right(unit);
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
  AsyncFailT<Unit> registerWithEmailPasswordSuperbase(
    RegisterWithEmailPasswordParams params,
  ) async {
    try {
      final supabaseClient = supabase.Supabase.instance.client;

      // check if the user already exists
      final existingUser = await supabaseClient.auth.signInWithPassword(
        email: params.email.getOrCrash,
        password: params.password.getOrCrash,
      );
      if (existingUser.user != null) {
        return const Left(Failure('User already exists.'));
      }

      final res = await supabaseClient.auth.signUp(
        email: params.email.getOrCrash,
        password: params.password.getOrCrash,
      );

      if (res.user != null && res.user!.emailConfirmedAt == null) {
        return const Left(Failure('Email not confirmed.'));
      }

      return const Right(unit);
    } on supabase.AuthException catch (e) {
      if (e.code == 'invalid_credentials') {
        return const Left(Failure('No user found for that email.'));
      } else if (e.code == 'email_not_confirmed') {
        return const Left(Failure('User already exists, but email not confirmed.'));
      }
      return Left(Failure('An error occurred: ${e.message}'));
    } on Exception catch (e) {
      return Left(Failure('An error occurred: $e'));
    }
  }
}
