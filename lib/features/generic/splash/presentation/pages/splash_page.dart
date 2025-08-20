import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/auth/login/login.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/generic/splash/splash.dart';
import 'package:flutter_showcase/features/home/home.dart';
import 'package:flutter_showcase/injection.dart';
import 'package:go_router/go_router.dart';

part 'splash_page.ui.middle.dart';

/// The splash page.
class SplashPage extends StatelessWidget {
  /// Creates an instance of the SplashPage.
  const SplashPage({super.key});

  /// Splash router path '/'
  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    /// Function to navigate to the next page based on authentication status.
    void navigateToNextPage(BuildContext context, state) {
      final splashState = context.read<SplashCubit>().state;
      if (splashState.isAuthenticated) {
        context.read<AuthenticationCubit>().setAuthenticated(splashState.user!);
        context.pushReplacement(HomePage.pushPath);
        return;
      }

      context.pushReplacement(LoginPage.path);
    }

    return BlocProvider(
      create: (context) => getIt<SplashCubit>(),
      child: Builder(
        builder: (context) {
          return BlocListener<SplashCubit, SplashState>(
            // listenWhen: (previous, current) => previous.isAuthenticated != current.isAuthenticated,
            listener: navigateToNextPage,
            child: const Scaffold(body: SplashPageUiMiddle()),
          );
        },
      ),
    );
  }
}
