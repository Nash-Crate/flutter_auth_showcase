part of 'in_app_purchase_cubit.dart';

/// Import necessary packages
enum InAppPurchaseStatus {
  /// idle state
  idle,

  /// processing state
  processing,

  /// success state
  success,

  /// error state
  error,
}

/// State for managing in-app purchases
@freezed
abstract class InAppPurchaseState with _$InAppPurchaseState {
  /// constructor
  const factory InAppPurchaseState({
    @Default(InAppPurchaseStatus.idle) InAppPurchaseStatus status,
    Either<Failure, Unit>? result,
  }) = _InAppPurchaseState;

  /// Initial state
  factory InAppPurchaseState.initial() => const InAppPurchaseState();

  const InAppPurchaseState._();
}
