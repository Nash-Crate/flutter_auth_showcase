import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'in_app_purchase_cubit.freezed.dart';
part 'in_app_purchase_state.dart';

/// Cubit for managing in-app purchases
@singleton
class InAppPurchaseCubit extends Cubit<InAppPurchaseState> {
  /// Constructor
  InAppPurchaseCubit(this._purchaseCoins, this._getAvailableProducts)
    : super(InAppPurchaseState.initial()) {
    getProducts();
  }

  final PurchaseCoins _purchaseCoins;
  final GetAvailableProducts _getAvailableProducts;

  /// get all available products
  Future<void> getProducts() async {
    emit(state.copyWith(status: InAppPurchaseStatus.processing));
    final result = await _getAvailableProducts();
    if (result.isLeft()) addError(result.asL.message);
    // emit(
    //   state.copyWith(
    //     status: result.isLeft() ? InAppPurchaseStatus.error : InAppPurchaseStatus.success,
    //     result: result,
    //   ),
    // );
  }

  /// Method to handle coin purchases
  Future<void> purchaseCoins(String productId) async {
    emit(state.copyWith(status: InAppPurchaseStatus.processing));

    final result = await _purchaseCoins(productId);
    if (result.isLeft()) addError(result.asL.message);

    emit(
      state.copyWith(
        status: result.isLeft() ? InAppPurchaseStatus.error : InAppPurchaseStatus.success,
        result: result,
      ),
    );
  }
}
