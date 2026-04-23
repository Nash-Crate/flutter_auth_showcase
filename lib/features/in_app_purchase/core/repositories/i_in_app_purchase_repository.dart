import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:fpdart/fpdart.dart';

/// Interface for the InAppPurchase repository.
mixin IInAppPurchaseRepository {
  /// initialize the in-app purchase functionality
  Future<Either<Failure, Unit>> initialize();

  /// listen to the purchase updates stream
  Stream<Either<Failure, List<String>>> purchaseUpdates();

  /// get the list of products available for purchase
  Future<Either<Failure, List<PurchasableProduct>>> getAvailableProducts();

  /// purchase a product from a product id
  Future<Either<Failure, Unit>> purchaseProduct(String productId);
}
