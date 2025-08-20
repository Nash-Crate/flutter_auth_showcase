part of 'posts_page.dart';

/// Posts page middle section
class PostsPageUiMiddle extends StatelessWidget {
  /// Constructor
  const PostsPageUiMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, Either<Failure, List<Post>>?>(
      selector: (state) => state.posts,
      builder: (context, postsEither) {
        if (postsEither == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (postsEither.isLeft()) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                postsEither.asL.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red),
              ),
            ),
          );
        } else if (postsEither.asR.isEmpty) {
          return Center(
            child: Text('No posts available', style: Theme.of(context).textTheme.bodySmall),
          );
        }

        return ListView.builder(
          itemCount: postsEither.asR.length,
          itemBuilder: (context, index) {
            final post = postsEither.asR[index];

            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(post.title, style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(post.content, style: Theme.of(context).textTheme.bodySmall),
                  ),
                  if (post.mediaUrl != null && post.mediaType == MediaTypeEnum.image)
                    Image.network(post.mediaUrl!),
                  if (post.mediaUrl != null && post.mediaType == MediaTypeEnum.video)
                    AppVideoPlayer(mediaPath: post.mediaUrl!, isNetwork: true),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
