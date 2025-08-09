part of 'login_page.dart';

/// Login page app bar
class LoginPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// constructor
  const LoginPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Login'),
    );
  }
}
