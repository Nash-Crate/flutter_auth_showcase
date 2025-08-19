part of 'login_page.dart';

/// Login page middle section
class LoginPageBottomNav extends StatelessWidget {
  /// constructor
  const LoginPageBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('OR'),
          TextButton(
            onPressed: () => context.push(RegisterPage.path),
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
