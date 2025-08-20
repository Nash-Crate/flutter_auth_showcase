import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase for signing out a user
@singleton
class SignOutUser implements UsecaseNoParams<Unit> {
  /// Constructor
  const SignOutUser(this._authRepository);

  final IAuthRepository _authRepository;

  @override
  Future<Either<Failure, Unit>> call() {
    return _authRepository.signOut();
  }
}
