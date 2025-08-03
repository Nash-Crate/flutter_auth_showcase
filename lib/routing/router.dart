import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/features/splash/splash.dart';
import 'package:flutter_auth/logger.dart';
import 'package:go_router/go_router.dart';

/// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: SplashPage.path,
  observers: [BotToastNavigatorObserver()],
  routes: [
    GoRoute(path: SplashPage.path, builder: (context, state) => const SplashPage()),
  ],
  errorBuilder: (context, state) {
    logger.e(state.error);
    return Scaffold(body: Center(child: Text(state.error.toString())));
  },
);
