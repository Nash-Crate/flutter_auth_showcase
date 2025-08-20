import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/generic/splash/splash.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase to get cached authentication user
@singleton
class GetCachedAuth implements UsecaseNoParams<AuthUser?> {
  /// Constructor
  const GetCachedAuth(this._authRepository);

  final IAuthRepository _authRepository;

  @override
  Future<Either<Failure, AuthUser?>> call() {
    return _authRepository.getCachedAuth();
  }
}
