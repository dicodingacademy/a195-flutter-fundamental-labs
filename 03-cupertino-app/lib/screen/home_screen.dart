import 'package:cupertino_app/screen/feeds_screen.dart';
import 'package:cupertino_app/screen/search_screen.dart';
import 'package:cupertino_app/screen/setting_screen.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  // todo-dialog-03: add static value for route name, this screen and HomeScreen
  static const String nameRoute = "home";

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // todo-tab-02: create a new screen called HomeScreen and add CupertinoTabScaffold
    return CupertinoTabScaffold(
      // todo-tab-03: add CupertinoTabBar for bottom navbar
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.news),
          label: 'Feeds',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          label: 'Settings',
        ),
      ]),
      // todo-tab-04: add tab builder to open the exact screen  based on index
      tabBuilder: (context, index) {
        return switch (index) {
          1 => const SearchScreen(),
          2 => const SettingScreen(),
          _ => const FeedsScreen()
        };
      },
    );
  }
}
