// Needed for usecases implementation
// ignore_for_file: one_member_abstracts
import 'package:flutter_showcase/features/common/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

/// Interface for usecase with [Params] and returns [ReturnType]
abstract interface class Usecase<ReturnType, Params> {
  /// Call the usecase with params
  Future<Either<Failure, ReturnType>> call(Params params);
}

/// Interface for usecase with no params and returns [ReturnType]
abstract interface class UsecaseNoParams<ReturnType> {
  /// Call the usecase
  Future<Either<Failure, ReturnType>> call();
}

/// Interface for synchronous usecase with no params and returns [ReturnType]
abstract interface class UsecaseNoParamsSync<ReturnType> {
  /// Call the usecase
  Either<Failure, ReturnType> call();
}

/// Interface for synchronous usecase with [Params] and returns [ReturnType]
abstract interface class UsecaseSync<ReturnType, Params> {
  /// Call the usecase with params
  Either<Failure, ReturnType> call(Params params);
}

/// Interface for streamed usecase with [Params] and returns [ReturnType]
abstract interface class UsecaseStream<ReturnType, Params> {
  /// Call the usecase with params
  Stream<Either<Failure, ReturnType>> call(Params params);
}

/// Interface for streamed usecase with no params and returns [ReturnType]
abstract interface class UsecaseStreamNoParams<ReturnType> {
  /// Call the usecase
  Stream<Either<Failure, ReturnType>> call();
}
