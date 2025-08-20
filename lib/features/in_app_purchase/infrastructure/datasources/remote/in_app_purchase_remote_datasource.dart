import 'dart:async';

import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';

/// Interface for the InAppPurchase remote data source.
abstract class InAppPurchaseRemoteDataSource with IInAppPurchaseRepository {}

/// Implementation of the InAppPurchase remote data source.
@Singleton(as: InAppPurchaseRemoteDataSource)
class InAppPurchaseRemoteDataSourceImpl implements InAppPurchaseRemoteDataSource {
  /// constructor
  InAppPurchaseRemoteDataSourceImpl(this._inAppPurchase);

  final InAppPurchase _inAppPurchase;

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
      final products = response.productDetails.map((p) {
        return PurchasableProduct(
          id: p.id,
          title: p.title,
          description: p.description,
          price: p.price,
        );
      }).toList();

      return Right(products);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
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
