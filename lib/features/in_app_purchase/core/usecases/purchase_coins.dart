import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase for purchasing coins in the app
@singleton
class PurchaseCoins implements Usecase<Unit, String> {
  /// Constructor
  const PurchaseCoins(this._repository);

  final IInAppPurchaseRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(String productId) {
    return _repository.purchaseProduct(productId);
  }
}
