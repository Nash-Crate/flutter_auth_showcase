import 'package:collection/collection.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Interface for local configs data source
abstract class ConfigsLocalDataSource with IConfigRepository {}

/// Implementation of the ConfigsLocalDataSource
@Singleton(as: ConfigsLocalDataSource)
class ConfigsLocalDataSourceImpl implements ConfigsLocalDataSource {
  /// Constructor
  const ConfigsLocalDataSourceImpl(this._cacheStorage);

  final ICacheStorage _cacheStorage;

  @override
  AsyncFailT<AuthenticationStrategy> getAuthStrategy() async {
    try {
      final result = await _cacheStorage.read<String?>(key: CacheKeys.authStrategy.name);
      final value = AuthenticationStrategy.values.firstWhereOrNull(
        (e) => result != null && e.name == result,
      );

      if (value != null) return Right(value);
      return const Left(Failure('No authentication strategy set'));
    } on Exception catch (e) {
      return Left(InfraExceptions.exceptionToFailure(e));
    }
  }

  @override
  AsyncFailT<Unit> setAuthStrategy(AuthenticationStrategy strategy) async {
    try {
      await _cacheStorage.upsert<String>(key: CacheKeys.authStrategy.name, data: strategy.name);

      return const Right(unit);
    } on Exception catch (e) {
      return Left(InfraExceptions.exceptionToFailure(e));
    }
  }
}
