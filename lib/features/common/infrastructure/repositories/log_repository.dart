import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Repository implementation for logging actions in the application.
@Singleton(as: ILogRepository)
class LogRepository implements ILogRepository {
  /// Constructor
  const LogRepository(this._logRemoteDataSource);

  final LogRemoteDataSource _logRemoteDataSource;

  @override
  AsyncFailT<Unit> addLog(NewLogParams params) {
    return _logRemoteDataSource.addLog(params);
  }
}
