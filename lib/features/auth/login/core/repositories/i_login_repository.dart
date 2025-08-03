import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/common/common.dart';

/// interface for login repository
mixin ILoginRepository {
  /// Login with email and password
  AsyncFailT<AuthUser> loginWithEmailPasswordFirebase(LoginWithEmailPasswordParams params);
}
