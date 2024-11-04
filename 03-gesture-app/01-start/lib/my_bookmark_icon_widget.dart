import 'package:flutter/material.dart';

class MyBookmarkIconWidget extends StatefulWidget {
  const MyBookmarkIconWidget({super.key});

  @override
  State<MyBookmarkIconWidget> createState() => _MyBookmarkIconWidgetState();
}

class _MyBookmarkIconWidgetState extends State<MyBookmarkIconWidget> {
  // todo-tap-01: create a variable that control Icons

  @override
  Widget build(BuildContext context) {
    // todo-tap-02: wrap the Icon with GestureDetector

    // todo-tap-03: add onTap callback and set the variable differently

    return Icon(
      // todo-tap-04: change the icon and color based on value
      Icons.bookmark_border,
      color: Colors.grey,
      size: 60,
    );
  }
}
