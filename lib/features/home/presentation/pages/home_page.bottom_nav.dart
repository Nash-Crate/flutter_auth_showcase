part of 'home_page.dart';

/// Home page bottom navigation bar
class HomePageBottomNavigationBar extends StatelessWidget {
  /// Constructor
  const HomePageBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
          tooltip: 'Profile',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            context.push(PostsPage.pushPath);
          case 1:
            context.push(UserProfilePage.pushPath);
        }
      },
    );
  }
}
