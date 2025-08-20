import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/home/home.dart';
import 'package:flutter_showcase/injection.dart';
import 'package:go_router/go_router.dart';

part 'add_post_page.app_bar.dart';
part 'add_post_page.bottom_nav.dart';
part 'add_post_page.ui.middle.dart';

/// Add post page widget
class AddPostPage extends StatelessWidget {
  /// constructor
  const AddPostPage({super.key});

  /// Router path 'add-post'
  static String path = 'add-post';

  /// Push path '/home/add-post'
  static String pushPath = '${HomePage.path}/$path';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddPostCubit>(),
      child: Builder(
        builder: (context) {
          return BlocListener<AddPostCubit, AddPostState>(
            listener: (context, state) {
              if (state.result != null && state.result!.isRight()) {
                showSuccessNotification('Post added successfully');

                context.pop(true);
              }
            },
            child: Stack(
              children: [
                const Scaffold(
                  appBar: AddPostPageAppBar(),
                  body: AddPostPageMiddleUi(),
                  bottomNavigationBar: AddPostPageBottomNav(),
                ),

                BlocSelector<AddPostCubit, AddPostState, bool>(
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
            ),
          );
        },
      ),
    );
  }
}
