import 'package:cupertino_app/screen/category_screen.dart';
import 'package:cupertino_app/screen/home_screen.dart';
import 'package:cupertino_app/static/my_route.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // todo-01-app-01: remove MaterialApp and add CupertinoApp
    return CupertinoApp(
      // todo-01-app-02: add Cupertino Theme at CupertinoApp
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      // todo-01-app-06: add Setting to the home of CupertinoApp
      // todo-02-tab-05: change the home parameter to HomeScreen
      // home: const HomeScreen(),
      // todo-03-dialog-04: add route for category
      initialRoute: MyRoute.home.name,
      routes: {
        MyRoute.home.name: (BuildContext _) => const HomeScreen(),
        MyRoute.category.name: (context) => CategoryScreen(
              selectedCategory:
                  ModalRoute.of(context)?.settings.arguments as String,
            )
      },
    );
  }
}
