part of 'add_post_page.dart';

/// Add post page middle UI widget
class AddPostPageMiddleUi extends StatelessWidget {
  /// constructor
  const AddPostPageMiddleUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              onChanged: context.read<AddPostCubit>().setPostTitle,
            ),

            const SizedBox(height: 20),

            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              onChanged: context.read<AddPostCubit>().setPostContent,
            ),

            const SizedBox(height: 20),

            BlocBuilder<AddPostCubit, AddPostState>(
              buildWhen: (previous, current) => previous.mediaPath != current.mediaPath,
              builder: (context, state) {
                return SizedBox(
                  height: context.mq.size.width,
                  width: context.mq.size.width,
                  child: state.isImage
                      ? Image.file(File(state.mediaPath))
                      : (state.isVideo
                            ? AppVideoPlayer(mediaPath: state.mediaPath)
                            : const Placeholder()),
                );
              },
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // context.read<AddPostCubit>().pickMediaFromImagePicker(
                //   fromGallery: false,
                //   isVideo: true,
                // );
                showModalBottomSheet<void>(
                  context: context,
                  builder: (ctx) => BlocProvider.value(
                    value: BlocProvider.of<AddPostCubit>(context),
                    child: MediaPickerBottomSheet(
                      takeImageFromCamera: () {
                        context.read<AddPostCubit>().pickMediaFromImagePicker(
                          fromGallery: false,
                          isVideo: false,
                        );
                      },
                      takeVideoFromCamera: () {
                        context.read<AddPostCubit>().pickMediaFromImagePicker(
                          fromGallery: false,
                          isVideo: true,
                        );
                      },
                      pickImageFromGallery: () {
                        context.read<AddPostCubit>().pickMediaFromImagePicker(
                          fromGallery: true,
                          isVideo: false,
                        );
                      },
                      pickVideoFromGallery: () {
                        context.read<AddPostCubit>().pickMediaFromImagePicker(
                          fromGallery: true,
                          isVideo: true,
                        );
                      },
                    ),
                  ),
                );
              },
              child: const Text('Upload media'),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
