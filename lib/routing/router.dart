import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/generic/splash/splash.dart';
import 'package:flutter_auth/features/home/home.dart';
import 'package:flutter_auth/logger.dart';
import 'package:go_router/go_router.dart';

/// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: SplashPage.path,
  observers: [BotToastNavigatorObserver()],
  routes: [
    GoRoute(path: SplashPage.path, builder: (context, state) => const SplashPage()),
    GoRoute(path: LoginPage.path, builder: (context, state) => const LoginPage()),
    GoRoute(
      path: HomePage.path,
      // redirect: (BuildContext context, GoRouterState state) {
      //   // Redirect to login if not authenticated
      //   // TODO(improve): make a parent route for authentication to prevent this check in every route
      //   final isAuthenticated = getIt<AuthenticationCubit>().state is Authenticated;
      //   if (!isAuthenticated) return LoginPage.path;
      //
      //   // No redirect needed
      //   return null;
      // },
      builder: (context, state) {
        return const HomePage();
      },
      // routes: [
      //   GoRoute(
      //     path: 'details',
      //     builder: (context, state) {
      //       return DetailsScreen();
      //     },
      //   ),
      // ],
    ),
  ],
  errorBuilder: (context, state) {
    logger.e(state.error);
    return Scaffold(body: Center(child: Text(state.error.toString())));
  },
);
