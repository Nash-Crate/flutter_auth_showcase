import 'package:flutter_showcase/features/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_log_params.freezed.dart';

/// parameters for adding a new log
@freezed
abstract class NewLogParams with _$NewLogParams {
  /// constructor
  const factory NewLogParams({
    required LogType type,
    required LogMethod method,
    required String message,
    Map<String, Object>? parameters,
  }) = _NewLogParams;
}
