part of 'add_post_page.dart';

/// Add post page app bar widget
class AddPostPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// constructor
  const AddPostPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Add new post'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
