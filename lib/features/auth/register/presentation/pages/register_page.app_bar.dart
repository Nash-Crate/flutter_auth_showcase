part of 'register_page.dart';

/// Register page app bar
class RegisterPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// constructor
  const RegisterPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Register'),
    );
  }
}
