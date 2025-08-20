import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase to get the list of available products for purchase
@singleton
class GetAvailableProducts implements UsecaseNoParams<List<PurchasableProduct>> {
  /// Constructor
  const GetAvailableProducts(this._repository);

  final IInAppPurchaseRepository _repository;

  @override
  Future<Either<Failure, List<PurchasableProduct>>> call() {
    return _repository.getAvailableProducts();
  }
}
