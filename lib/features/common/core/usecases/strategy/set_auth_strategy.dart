import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase for setting the authentication strategy
@singleton
class SetAuthStrategy implements Usecase<Unit, AuthenticationStrategy> {
  /// Constructor
  const SetAuthStrategy(this._configRepository);

  final IConfigRepository _configRepository;

  @override
  Future<Either<Failure, Unit>> call(AuthenticationStrategy params) {
    return _configRepository.setAuthStrategy(params);
  }
}
