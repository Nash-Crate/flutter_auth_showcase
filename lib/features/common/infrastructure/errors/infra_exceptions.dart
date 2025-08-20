import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_exceptions.dart';
part 'infra_exceptions.freezed.dart';

/// Base class for all [Failure]s
@freezed
class InfraExceptions with _$InfraExceptions {
  /// [InfraExceptions]
  const factory InfraExceptions() = _InfraExceptions;

  const InfraExceptions._();

  /// Converts a [DioException] to a [Failure]
  static Failure exceptionToFailure(dynamic error) {
    /// ignorable errors - mostly just to notify when debugging
    if (error is ConnectionFailureError) {
      logger.i('[InfraExceptions] [FAILURE] $error');
      return const Failure('Network connection error');
    }

    /// major exceptions/ errors and failures
    logger.e('[InfraExceptions] [FAILURE] $error');
    if (error is UnexpectedValueError) {
      return Failure(
        'Unable to process the request: ${error.valueFailure.failedValue?.toString() ?? 'Something went wrong'}',
      );
    } else if (error is PlatformException) {
      return _getPlatformException(error);
    }
    // websocket_channel
    else if (error is Exception) {
      // Dio
      if (error is DioException) {
        return _getDioException(error);
      }
      // TODO(infraExceptions): else if (MQTT)

      // else
      return Failure('Unexpected error: $error');
    } else {
      // custom features' failures
      // if (error is AuthFailure) {
      //   return Failure.authFailure(error);
      // } else if (error is CacheFailure) {
      //   return Failure.cacheFailure(error);
      // } else if (error is NetworkFailure) {
      //   return Failure.networkFailure(error);
      // } else if (error.toString().contains('is not a subtype of')) {
      //   return Failure.unableToProcess(error.toString());
      // }
      return Failure('unexpectedError: $error');
    }
  }

  static Failure _getPlatformException(PlatformException error) {
    late Failure failure;
    switch (error.code) {
      default:
        failure = Failure('Platform Exception: ${error.message ?? 'Unknown error'}');
    }
    return failure;
  }
}
