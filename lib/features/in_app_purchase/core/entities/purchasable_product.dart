import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchasable_product.freezed.dart';

/// Represents the details of a product in an in-app purchase.
enum ProductStatus {
  /// The product is available for purchase.
  purchasable,

  /// The product is currently being purchased.
  purchased,

  /// The product is not available for purchase.
  pending,
}

/// Represents an in-app purchase product.
@freezed
abstract class PurchasableProduct with _$PurchasableProduct {
  /// constructor
  const factory PurchasableProduct({
    required String id,
    required String title,
    required String description,
    required String price,
    @Default(ProductStatus.purchasable) ProductStatus status,
    // required ProductDetails productDetails,
  }) = _PurchasableProduct;
}
