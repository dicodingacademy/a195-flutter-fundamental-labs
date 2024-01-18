// todo-dialog-01: create a CategoryScreen that have a string parameter
import 'package:flutter/cupertino.dart';

class CategoryScreen extends StatelessWidget {
  final String selectedCategory;
  // todo-dialog-02: add static value for route name, this screen and HomeScreen
  static const String nameRoute = "category";

  const CategoryScreen({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$selectedCategory Screen'),
      ),
      child: Center(
        child: Text(
          '$selectedCategory Screen',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
