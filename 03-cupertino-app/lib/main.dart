import 'package:cupertino_app/screen/category_screen.dart';
import 'package:cupertino_app/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // todo-app-01: remove MaterialApp and add CupertinoApp
    return CupertinoApp(
      // todo-app-02: add Cupertino Theme at CupertinoApp
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      // todo-app-05: add Setting to the home of CupertinoApp
      // todo-tab-05: change the home parameter to HomeScreen
      home: const HomeScreen(),
      // todo-dialog-04: add route for category
      initialRoute: HomeScreen.nameRoute,
      routes: {
        HomeScreen.nameRoute: (BuildContext _) => const HomeScreen(),
        CategoryScreen.nameRoute: (context) => CategoryScreen(
              selectedCategory:
                  ModalRoute.of(context)?.settings.arguments as String,
            )
      },
    );
  }
}
