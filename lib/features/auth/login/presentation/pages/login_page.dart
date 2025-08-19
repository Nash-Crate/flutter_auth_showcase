import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/auth/login/login.dart';
import 'package:flutter_showcase/features/auth/register/register.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/home/home.dart';
import 'package:flutter_showcase/injection.dart';
import 'package:go_router/go_router.dart';

part 'login_page.app_bar.dart';
part 'login_page.bottom_nav.dart';
part 'login_page.ui.middle.dart';

/// Login page
class LoginPage extends StatelessWidget {
  /// constructor
  const LoginPage({super.key});

  /// router path '/login'
  static String path = '/login';

  /// on login state changed
  void onLoginStateChanged(BuildContext context, LoginState state) {
    if (state.user != null) {
      context.read<AuthenticationCubit>().setAuthenticated(state.user!);
      context.pushReplacement(HomePage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Builder(
        builder: (context) {
          return BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) => previous.user?.id != current.user?.id,
            listener: onLoginStateChanged,
            child: const Scaffold(
              appBar: LoginPageAppBar(),
              body: SafeArea(child: LoginPageUiMiddle()),
              bottomNavigationBar: LoginPageBottomNav(),
            ),
          );
        },
      ),
    );
  }
}
