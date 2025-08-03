part of 'splash_page.dart';

/// The splash page middle UI section.
class SplashPageUiMiddle extends StatelessWidget {
  /// Creates an instance of the SplashPage Middle UI.
  const SplashPageUiMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
