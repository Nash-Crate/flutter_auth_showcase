import 'package:flutter_showcase/features/auth/register/register.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Register with email and password use case
@singleton
class RegisterWithEmailPasswordSuperbase implements Usecase<Unit, RegisterWithEmailPasswordParams> {
  /// Constructor for the use case
  const RegisterWithEmailPasswordSuperbase(this._registerRepository);

  final IRegisterRepository _registerRepository;

  @override
  AsyncFailT<Unit> call(RegisterWithEmailPasswordParams params) {
    return _registerRepository.registerWithEmailPasswordSuperbase(params);
  }
}
