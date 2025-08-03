import 'package:flutter/material.dart';
import 'package:flutter_auth/extensions/extensions.dart';

part 'splash_page.ui.middle.dart';

/// The splash page.
class SplashPage extends StatelessWidget {
  /// Creates an instance of the SplashPage.
  const SplashPage({super.key});

  /// The path for the splash page.
  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashPageUiMiddle(),
    );
  }
}
