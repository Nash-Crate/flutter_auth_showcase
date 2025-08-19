import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/auth/register/register.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/injection.dart';
import 'package:go_router/go_router.dart';

part 'register_page.app_bar.dart';
part 'register_page.bottom_nav.dart';
part 'register_page.ui.middle.dart';

/// Register page
class RegisterPage extends StatelessWidget {
  /// constructor
  const RegisterPage({super.key});

  /// router path '/register'
  static String path = '/register';

  /// on state changed
  void onRegisterStateChanged(BuildContext context, RegisterState state) {
    if (state.success) {
      // Show success message
      showSuccessNotification('Registration successful, please login.');
      // Navigate back to the login page
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Builder(
        builder: (context) {
          return BlocListener<RegisterCubit, RegisterState>(
            listenWhen: (previous, current) => previous.success != current.success,
            listener: onRegisterStateChanged,
            child: const Scaffold(
              appBar: RegisterPageAppBar(),
              body: SafeArea(child: RegisterPageUiMiddle()),
              bottomNavigationBar: RegisterPageBottomNav(),
            ),
          );
        },
      ),
    );
  }
}
