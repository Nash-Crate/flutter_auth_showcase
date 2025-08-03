// Needed for usecases implementation
// ignore_for_file: one_member_abstracts
import 'package:flutter_auth/features/common/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

/// Interface for usecase with [Params] and returns [Type]
abstract interface class Usecase<Type, Params> {
  /// Call the usecase with params
  Future<Either<Failure, Type>> call(Params params);
}

/// Interface for usecase with no params and returns [Type]
abstract interface class UsecaseNoParams<Type> {
  /// Call the usecase
  Future<Either<Failure, Type>> call();
}

/// Interface for synchronous usecase with no params and returns [Type]
abstract interface class UsecaseNoParamsSync<Type> {
  /// Call the usecase
  Either<Failure, Type> call();
}

/// Interface for synchronous usecase with [Params] and returns [Type]
abstract interface class UsecaseSync<Type, Params> {
  /// Call the usecase with params
  Either<Failure, Type> call(Params params);
}

/// Interface for streamed usecase with [Params] and returns [Type]
abstract interface class UsecaseStream<Type, Params> {
  /// Call the usecase with params
  Stream<Either<Failure, Type>> call(Params params);
}

/// Interface for streamed usecase with no params and returns [Type]
abstract interface class UsecaseStreamNoParams<Type> {
  /// Call the usecase
  Stream<Either<Failure, Type>> call();
}
