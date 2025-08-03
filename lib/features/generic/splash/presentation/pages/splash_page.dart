import 'package:flutter/material.dart';
import 'package:flutter_auth/extensions/extensions.dart';
import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/common/common.dart';
import 'package:flutter_auth/features/generic/splash/splash.dart';
import 'package:flutter_auth/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'splash_page.ui.middle.dart';

/// The splash page.
class SplashPage extends StatelessWidget {
  /// Creates an instance of the SplashPage.
  const SplashPage({super.key});

  /// The path for the splash page.
  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    /// Function to navigate to the next page based on authentication status.
    void navigateToNextPage(BuildContext context, state) {
      final splashState = context.read<SplashCubit>().state;
      if (splashState.isAuthenticated) {
        context.read<AuthenticationCubit>().setAuthenticated(splashState.user!);
        // TODO(uncomment): context.pushReplacement(HomePage.path);
        return;
      }

      context.pushReplacement(LoginPage.path);
    }

    return BlocProvider(
      create: (context) => getIt<SplashCubit>(),
      child: Builder(
        builder: (context) {
          return BlocListener<SplashCubit, SplashState>(
            listenWhen: (previous, current) => previous.isAuthenticated != current.isAuthenticated,
            listener: navigateToNextPage,
            child: const Scaffold(
              body: SplashPageUiMiddle(),
            ),
          );
        },
      ),
    );
  }
}
