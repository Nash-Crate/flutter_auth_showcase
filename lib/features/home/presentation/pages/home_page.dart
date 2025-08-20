import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/features/home/home.dart';
import 'package:flutter_showcase/features/profile/profile.dart';
import 'package:flutter_showcase/injection.dart';
import 'package:go_router/go_router.dart';

part 'home_page.bottom_nav.dart';

/// Home page widget
class HomePage extends StatelessWidget {
  /// Constructor
  const HomePage(this.body, {super.key});

  /// Content body
  final Widget body;

  /// Push path '/home/posts'
  static String pushPath = PostsPage.pushPath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              Scaffold(
                appBar: const HomePageAppBar(),
                body: body,
                bottomNavigationBar: const HomePageBottomNavigationBar(),
              ),

              BlocSelector<HomeCubit, HomeState, bool>(
                selector: (state) => state.processing,
                builder: (context, processing) {
                  if (!processing) return const SizedBox.shrink();
                  return const ColoredBox(
                    color: Colors.black54,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
