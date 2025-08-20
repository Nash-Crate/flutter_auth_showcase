import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/in_app_purchase/in_app_purchase.dart';
import 'package:flutter_showcase/injection.dart';
import 'package:flutter_showcase/routing/router.dart';
import 'package:flutter_showcase/theme/theme.dart';

/// BotToastInit instance
final TransitionBuilder botToastBuilder = BotToastInit();

/// The main application widget.
class App extends StatelessWidget {
  /// Creates an instance of the App widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthenticationCubit>()),
        BlocProvider(create: (context) => getIt<InAppPurchaseCubit>(), lazy: false),
      ],
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
