import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/common/common.dart';

/// interface for login repository
mixin ILoginRepository {
  /// Login with email and password for Firebase
  AsyncFailT<AuthUser> loginWithEmailPasswordFirebase(LoginWithEmailPasswordParams params);

  /// Login with email and password for Superbase
  AsyncFailT<AuthUser> loginWithEmailPasswordSuperbase(LoginWithEmailPasswordParams params);
}
