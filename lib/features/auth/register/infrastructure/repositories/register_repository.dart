import 'package:flutter_showcase/features/auth/register/register.dart';
import 'package:flutter_showcase/features/common/types/typedefs.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Interface for register repository
@Singleton(as: IRegisterRepository)
class RegisterRepository implements IRegisterRepository {
  /// Constructor for RegisterRepository
  const RegisterRepository(this._registerDatasource);

  final RegisterDatasource _registerDatasource;

  @override
  AsyncFailT<Unit> registerWithEmailPasswordFirebase(RegisterWithEmailPasswordParams params) {
    return _registerDatasource.registerWithEmailPasswordFirebase(params);
  }

  @override
  AsyncFailT<Unit> registerWithEmailPasswordSuperbase(RegisterWithEmailPasswordParams params) {
    return _registerDatasource.registerWithEmailPasswordSuperbase(params);
  }
}
