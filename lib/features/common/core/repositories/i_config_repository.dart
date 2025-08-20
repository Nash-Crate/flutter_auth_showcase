import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';

/// Interface for configuration repository
mixin IConfigRepository {
  /// Sets the authentication strategy for the application.
  AsyncFailT<Unit> setAuthStrategy(AuthenticationStrategy strategy);

  /// Gets the current authentication strategy for the application.
  AsyncFailT<AuthenticationStrategy> getAuthStrategy();
}
