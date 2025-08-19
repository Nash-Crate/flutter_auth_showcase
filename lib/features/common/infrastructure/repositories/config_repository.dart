import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Implementation for configuration repository
@Singleton(as: IConfigRepository)
class ConfigRepository implements IConfigRepository {
  /// Constructor
  const ConfigRepository(this._configsLocalDataSource);

  final ConfigsLocalDataSource _configsLocalDataSource;

  @override
  AsyncFailT<AuthenticationStrategy> getAuthStrategy() {
    return _configsLocalDataSource.getAuthStrategy();
  }

  @override
  AsyncFailT<Unit> setAuthStrategy(AuthenticationStrategy strategy) {
    return _configsLocalDataSource.setAuthStrategy(strategy);
  }
}
