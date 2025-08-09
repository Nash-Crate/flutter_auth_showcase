import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase for adding a new log
@singleton
class AddNewLog implements Usecase<Unit, NewLogParams> {
  /// Constructor
  const AddNewLog(this._logRepository);

  final ILogRepository _logRepository;

  @override
  Future<Either<Failure, Unit>> call(NewLogParams params) {
    return _logRepository.addLog(params);
  }
}
