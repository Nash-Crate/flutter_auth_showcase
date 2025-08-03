import 'package:flutter/material.dart';
import 'package:flutter_auth/extensions/extensions.dart';
import 'package:flutter_auth/features/auth/login/login.dart';
import 'package:flutter_auth/features/common/common.dart';
import 'package:flutter_auth/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_page.ui.middle.dart';

/// Login page
class LoginPage extends StatelessWidget {
  /// constructor
  const LoginPage({super.key});

  /// router path
  static String path = '/login';

  /// on login state changed
  void onLoginStateChanged(BuildContext context, LoginState state) {
    if (state.user != null) {
      context.read<AuthenticationCubit>().setAuthenticated(state.user!);
      // TODO(uncomment): context.pushReplacement(HomePage.path);
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
              body: SafeArea(child: LoginPageUiMiddle()),
            ),
          );
        },
      ),
    );
  }
}
