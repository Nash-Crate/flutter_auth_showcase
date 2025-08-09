part of 'home_page.dart';

/// Home page app bar
class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Constructor
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (prev, current) => prev.isLoggedOut != current.isLoggedOut,
      listener: (context, state) {
        if (state.isLoggedOut) context.go(LoginPage.path);
      },
      child: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: context.read<HomeCubit>().logOut,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
