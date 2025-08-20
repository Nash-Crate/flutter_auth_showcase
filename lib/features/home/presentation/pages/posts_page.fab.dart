part of 'posts_page.dart';

/// Posts page floating action button widget
class PostsPageFab extends StatelessWidget {
  /// constructor
  const PostsPageFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add New Post',
      onPressed: () async {
        final res = await context.push(AddPostPage.pushPath);
        // refresh posts on successful post addition
        if (res != null && res is bool && res) {
          if (context.mounted) await context.read<HomeCubit>().getNewPosts();
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
