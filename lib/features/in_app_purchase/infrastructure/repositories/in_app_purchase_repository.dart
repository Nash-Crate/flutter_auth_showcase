import 'package:flutter_showcase/features/common/errors/failures.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// implementation of the InAppPurchase repository interface
@Singleton(as: IInAppPurchaseRepository)
class InAppPurchaseRepository implements IInAppPurchaseRepository {
  /// constructor
  const InAppPurchaseRepository(this._remoteDataSource);

  final InAppPurchaseRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<PurchasableProduct>>> getAvailableProducts() {
    return _remoteDataSource.getAvailableProducts();
  }

  @override
  Future<Either<Failure, Unit>> purchaseProduct(String productId) {
    return _remoteDataSource.purchaseProduct(productId);
  }

  @override
  Stream<Either<Failure, List<String>>> purchaseUpdates() {
    return _remoteDataSource.purchaseUpdates();
  }
}
