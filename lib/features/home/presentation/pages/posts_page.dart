import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/auth/login/login.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:flutter_showcase/features/home/home.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';

part 'posts_page.app_bar.dart';
part 'posts_page.fab.dart';
part 'posts_page.ui.middle.dart';

/// Posts page widget
class PostsPage extends StatelessWidget {
  /// Constructor
  const PostsPage({super.key});

  /// Router path '/posts'
  static String path = '/posts';

  /// Push path '/posts'
  static String pushPath = path;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PostsPageAppBar(),
      body: PostsPageUiMiddle(),
      floatingActionButton: PostsPageFab(),
    );
  }
}
