import 'package:flutter/material.dart';
import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/home/home.dart';
import 'package:flutter_auth/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'home_page.app_bar.dart';
part 'home_page.bottom_nav.dart';
part 'home_page.ui.middle.dart';

/// Home page widget
class HomePage extends StatelessWidget {
  /// Constructor
  const HomePage({super.key});

  /// Router path '/home'
  static String path = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              const Scaffold(
                appBar: HomePageAppBar(),
                body: HomePageUiMiddle(),
                bottomNavigationBar: HomePageBottomNavigationBar(),
              ),

              BlocSelector<HomeCubit, HomeState, bool>(
                selector: (state) => state.processing,
                builder: (context, processing) {
                  if (!processing) return const SizedBox.shrink();
                  return const ColoredBox(
                    color: Colors.black54,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
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
