import 'package:flutter_showcase/features/auth/register/register.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';

/// interface for register repository
mixin IRegisterRepository {
  /// Register with email and password for Firebase
  AsyncFailT<Unit> registerWithEmailPasswordFirebase(RegisterWithEmailPasswordParams params);

  /// Register with email and password for Superbase
  AsyncFailT<Unit> registerWithEmailPasswordSuperbase(RegisterWithEmailPasswordParams params);
}
