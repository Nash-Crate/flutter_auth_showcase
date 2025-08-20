part of '../../../in_app_purchase/presentation/blocs/in_app_purchase_cubit.dart';

/// State for managing in-app purchases
@freezed
class InAppPurchaseState with _$InAppPurchaseState {
  /// Initial state of the in-app purchase
  const factory InAppPurchaseState.initial() = _Initial;
}
