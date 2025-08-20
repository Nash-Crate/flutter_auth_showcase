import 'package:flutter/material.dart';

/// In-app coin purchase section widget
class InAppCoinPurchaseSection extends StatelessWidget {
  /// Constructor
  const InAppCoinPurchaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                // context.read<InAppPurchaseCubit>().purchaseCoins();
              },
              child: const Text('Purchase 10 coins'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Purchase 50 coins'),
            ),
          ],
        ),
      ),
    );
  }
}
