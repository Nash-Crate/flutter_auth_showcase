import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';

/// An interface for authentication repository
mixin IAuthRepository {
  /// Method to get cached authentication user
  AsyncFailT<AuthUser?> getCachedAuth();

  /// singout user from the app
  AsyncFailT<Unit> signOut();
}
