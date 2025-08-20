part of 'add_post_page.dart';

/// Add post page bottom navigation widget
class AddPostPageBottomNav extends StatelessWidget {
  /// constructor
  const AddPostPageBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: context.pop,
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: context.read<AddPostCubit>().savePost,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
