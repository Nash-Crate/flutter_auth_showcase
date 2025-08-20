import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';

/// Repository interface for logging actions in the application.
mixin ILogRepository {
  /// Adds a new log with the given [params].
  AsyncFailT<Unit> addLog(NewLogParams params);
}
