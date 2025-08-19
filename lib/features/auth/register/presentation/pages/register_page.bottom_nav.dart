part of 'register_page.dart';

/// Register page middle section
class RegisterPageBottomNav extends StatelessWidget {
  /// constructor
  const RegisterPageBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Go back to'),
          TextButton(
            onPressed: context.pop,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
