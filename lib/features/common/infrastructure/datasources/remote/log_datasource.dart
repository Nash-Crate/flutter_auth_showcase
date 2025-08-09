import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// abstract interface for remote log data source
abstract class LogRemoteDataSource with ILogRepository {}

/// Implementation of the LogRemoteDataSource
@Singleton(as: LogRemoteDataSource)
class LogRemoteDataSourceImpl implements LogRemoteDataSource {
  /// Constructor
  const LogRemoteDataSourceImpl(this._configsDs);

  final ConfigsLocalDataSource _configsDs;

  @override
  Future<Either<Failure, Unit>> addLog(NewLogParams params) async {
    try {
      switch (params.type) {
        case LogType.login:
          await _logLogin(params.method, params.parameters);
        case LogType.register:
          // TODO: Handle this case.
          throw UnimplementedError();
        case LogType.generic:
          await FirebaseAnalytics.instance.logEvent(
            name: params.method.name,
            parameters: params.parameters,
          );
      }

      return const Right(unit);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<void> _logLogin(LogMethod method, Map<String, Object>? parameters) async {
    final strategy = await _configsDs.getAuthStrategy();

    if (strategy.isLeft()) {
      throw Exception('Failed to get authentication strategy');
    }

    switch (strategy.asR) {
      case AuthenticationStrategy.firebase:
        await FirebaseAnalytics.instance.logLogin(loginMethod: method.name, parameters: parameters);
      case AuthenticationStrategy.superbase:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AuthenticationStrategy.restApi:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AuthenticationStrategy.graphql:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
