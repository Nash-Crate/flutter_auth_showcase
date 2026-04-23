import 'dart:async';

import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:flutter_showcase/logger.dart';
import 'package:fpdart/fpdart.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Interface for the InAppPurchase remote data source.
abstract class InAppPurchaseRemoteDataSource with IInAppPurchaseRepository {}

/// Implementation of the InAppPurchase remote data source.
@Singleton(as: InAppPurchaseRemoteDataSource)
class InAppPurchaseRemoteDataSourceImpl implements InAppPurchaseRemoteDataSource {
  /// constructor
  InAppPurchaseRemoteDataSourceImpl(this._inAppPurchase) {
    _inAppPurchase.purchaseStream.listen(
      (purchaseDetailsList) {
        logger.d('Purchase stream received: $purchaseDetailsList');
      },
      onError: (dynamic error) {
        logger.e('Purchase stream error: $error');
      },
    );
  }

  final InAppPurchase _inAppPurchase;

  @override
  Future<Either<Failure, Unit>> initialize() async {
    try {
      await Purchases.setLogLevel(LogLevel.warn);

      const apiKey = String.fromEnvironment('REVENUE_CAT_API_KEY');
      final configuration = PurchasesConfiguration(apiKey);
      await Purchases.configure(configuration);

      return const Right(unit);
    } on Exception catch (error) {
      return Left(InfraExceptions.exceptionToFailure(error));
    }
  }

  @override
  Stream<Either<Failure, List<String>>> purchaseUpdates() async* {
    yield* _inAppPurchase.purchaseStream.transform(
      StreamTransformer.fromHandlers(
        handleData: (value, sink) async {
          try {
            final data = ['Purchase updates received: ${value.length}'];
            sink.add(Right(data));
          } on Exception catch (error) {
            sink.add(Left(InfraExceptions.exceptionToFailure(error)));
          }
        },
        handleError: (error, _, sink) {
          sink.add(Left(InfraExceptions.exceptionToFailure(error)));
        },
        handleDone: (sink) {
          sink.close();
        },
      ),
    );
  }

  @override
  Future<Either<Failure, List<PurchasableProduct>>> getAvailableProducts() async {
    try {
      const useRevenueCat = 1 != 1;

      final products = useRevenueCat
          ? await _getAvailableProductsWithRevenueCat()
          : await _getAvailableProductsWithInAppPurchase();

      return products;
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<PurchasableProduct>>> _getAvailableProductsWithRevenueCat() async {
    final offerings = await Purchases.getOfferings();
    if (offerings.current != null && offerings.current!.availablePackages.isNotEmpty) {
      // Display packages for sale
      final products = offerings.current!.availablePackages.map((Package p) {
        final product = p.storeProduct;
        return PurchasableProduct(
          id: product.identifier,
          title: product.title,
          description: product.description,
          price: product.priceString,
        );
      }).toList();
      return Right(products);
    }
    return const Left(Failure('No products available'));
  }

  Future<Either<Failure, List<PurchasableProduct>>> _getAvailableProductsWithInAppPurchase() async {
    // check if the InAppPurchase service is available
    final available = await _inAppPurchase.isAvailable();
    if (!available) return const Left(Failure('InAppPurchase service is not available'));

    // get the instance of InAppPurchase
    const ids = <String>{
      // 'premium_user',
      'purchase_10_coins',
      'purchase_50_coins',
      // 'purchase_100_coins',
    };

    final response = await _inAppPurchase.queryProductDetails(ids);
    logger.d(response.productDetails);
    final products = response.productDetails.map((p) {
      return PurchasableProduct(
        id: p.id,
        title: p.title,
        description: p.description,
        price: p.price,
      );
    }).toList();

    return Right(products);
  }

  @override
  Future<Either<Failure, Unit>> purchaseProduct(String productId) async {
    try {
      // product.status = ProductStatus.pending;

      await Future<void>.delayed(const Duration(seconds: 5));
      // product.status = ProductStatus.purchased;

      return const Right(unit);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
