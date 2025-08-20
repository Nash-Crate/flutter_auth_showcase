import 'package:flutter/material.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';

/// User profile page
class UserProfilePage extends StatelessWidget {
  /// Constructor
  const UserProfilePage({super.key});

  /// Router path '/profile'
  static String path = '/profile';

  /// Push path '/profile'
  static String pushPath = path;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 0.2.sw,
            backgroundImage: const NetworkImage(
              'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
            ),
          ),
          const SizedBox(height: 20),
          const InAppCoinPurchaseSection(),
        ],
      ),
    );
  }
}
