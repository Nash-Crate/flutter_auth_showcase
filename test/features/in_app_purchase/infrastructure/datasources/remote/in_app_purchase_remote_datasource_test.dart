import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:mockito/annotations.dart';

import 'in_app_purchase_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<InAppPurchase>(),
])
void main() {
  late InAppPurchaseRemoteDataSourceImpl dataSource;
  late MockInAppPurchase mockInAppPurchase;

  setUp(() {
    mockInAppPurchase = MockInAppPurchase();
    dataSource = InAppPurchaseRemoteDataSourceImpl(mockInAppPurchase);
  });
}
