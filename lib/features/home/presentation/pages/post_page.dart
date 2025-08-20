import 'package:flutter/material.dart';
import 'package:flutter_showcase/features/home/home.dart';

/// Post details page widget
class PostPage extends StatelessWidget {
  /// constructor
  const PostPage({super.key});

  /// Router path 'post-details'
  static String path = 'post-details';

  /// Push path '/home/post-details'
  static String pushPath = '${PostsPage.path}/$path';

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
