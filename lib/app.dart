import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/features/common/common.dart';
import 'package:flutter_auth/injection.dart';
import 'package:flutter_auth/routing/router.dart';
import 'package:flutter_auth/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// BotToastInit instance
final TransitionBuilder botToastBuilder = BotToastInit();

/// The main application widget.
class App extends StatelessWidget {
  /// Creates an instance of the App widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthenticationCubit>(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            builder: (ctx, child) {
              // initialise screenUtil
              ScreenUtil.init(ctx);
              return Theme(data: lightTheme, child: botToastBuilder(ctx, child));
            },
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
