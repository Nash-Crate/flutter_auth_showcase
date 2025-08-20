import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'in_app_purchase_cubit.freezed.dart';
part 'in_app_purchase_state.dart';

/// Cubit for managing in-app purchases
@singleton
class InAppPurchaseCubit extends Cubit<InAppPurchaseState> {
  /// Constructor
  InAppPurchaseCubit() : super(const InAppPurchaseState.initial());
}
