import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';

/// External library injection for In-App Purchase feature.
@module
abstract class InAppPurchaseExternalLibraryInjectableModule {
  /// Provides the In-App Purchase instance.
  @singleton
  InAppPurchase get instance {
    return InAppPurchase.instance;
  }
}
