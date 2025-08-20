import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase/features/auth/login/login.dart';
import 'package:flutter_showcase/features/auth/register/register.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/generic/splash/splash.dart';
import 'package:flutter_showcase/features/home/home.dart';
import 'package:flutter_showcase/features/profile/profile.dart';
import 'package:flutter_showcase/injection.dart';
import 'package:flutter_showcase/logger.dart';
import 'package:go_router/go_router.dart';

/// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: SplashPage.path,
  observers: [
    // To show toast notifications
    BotToastNavigatorObserver(),

    // To log page views in Firebase Analytics
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  routes: [
    GoRoute(path: SplashPage.path, builder: (context, state) => const SplashPage()),
    GoRoute(path: LoginPage.path, builder: (context, state) => const LoginPage()),
    GoRoute(path: RegisterPage.path, builder: (context, state) => const RegisterPage()),
    ShellRoute(
      redirect: (BuildContext context, GoRouterState state) {
        // Redirect to login if not authenticated
        final isAuthenticated = getIt<AuthenticationCubit>().state is Authenticated;
        if (!isAuthenticated) return LoginPage.path;

        // // Redirect to onboarding if not completed
        // if (state.error != null) return PostsPage.path;

        // No redirect needed
        return null;
      },
      builder: (context, state, body) => HomePage(body),
      routes: [
        GoRoute(
          path: PostsPage.path,
          name: 'Posts',
          builder: (context, state) => const PostsPage(),
          routes: [
            GoRoute(
              path: AddPostPage.path,
              name: 'Add Post',
              builder: (context, state) {
                return const AddPostPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: UserProfilePage.path,
          name: 'Profile',
          builder: (context, state) => const UserProfilePage(),
        ),
      ],
    ),
    // GoRoute(
    //   path: HomePage.path,
    //   // redirect: (BuildContext context, GoRouterState state) {
    //   //   // Redirect to login if not authenticated
    //   //   // TODO(improve): make a parent route for authentication to prevent this check in every route
    //   //   final isAuthenticated = getIt<AuthenticationCubit>().state is Authenticated;
    //   //   if (!isAuthenticated) return LoginPage.path;
    //   //
    //   //   // No redirect needed
    //   //   return null;
    //   // },
    //   builder: (context, state) {
    //     return const HomePage();
    //   },
    //   routes: [
    //     GoRoute(
    //       path: PostPage.path,
    //       builder: (context, state) {
    //         return const PostPage();
    //       },
    //     ),
    //     GoRoute(
    //       path: AddPostPage.path,
    //       builder: (context, state) {
    //         return const AddPostPage();
    //       },
    //     ),
    //   ],
    // ),
  ],
  errorBuilder: (context, state) {
    logger.e(state.error);
    return Scaffold(
      body: Center(
        child: Text(state.error.toString(), style: const TextStyle(color: Colors.red)),
      ),
    );
  },
);
