import 'package:flutter_showcase/features/common/common.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase for getting the authentication strategy
@singleton
class GetAuthStrategy implements UsecaseNoParams<AuthenticationStrategy> {
  /// Constructor
  const GetAuthStrategy(this._configRepository);

  final IConfigRepository _configRepository;

  @override
  Future<Either<Failure, AuthenticationStrategy>> call() {
    return _configRepository.getAuthStrategy();
  }
}
