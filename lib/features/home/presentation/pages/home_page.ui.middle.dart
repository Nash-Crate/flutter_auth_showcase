part of 'home_page.dart';

/// Home page middle section
class HomePageUiMiddle extends StatelessWidget {
  /// Constructor
  const HomePageUiMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<Post>?>(
      selector: (state) => state.posts != null
          ? state.posts!.isRight()
                ? state.posts!.asR
                : null
          : null,
      builder: (context, posts) {
        if (posts == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (posts.isEmpty) {
          return Center(
            child: Text('No posts available', style: Theme.of(context).textTheme.bodySmall),
          );
        }

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];

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
