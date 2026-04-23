import 'package:flutter_showcase/features/common/core/core.dart';
import 'package:flutter_showcase/features/common/errors/failures.dart';
import 'package:flutter_showcase/features/in_app_purchase/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase to initialize in-app purchase functionality.
@singleton
class InitializeInAppPurchase implements UsecaseNoParams<Unit> {
  /// Constructor
  const InitializeInAppPurchase(this._repository);

  final IInAppPurchaseRepository _repository;

  @override
  Future<Either<Failure, Unit>> call() {
    return _repository.initialize();
  }
}
