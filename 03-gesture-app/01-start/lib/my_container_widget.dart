import 'package:flutter/material.dart';

class MyContainerWidget extends StatefulWidget {
  const MyContainerWidget({super.key});

  @override
  State<MyContainerWidget> createState() => _MyContainerWidgetState();
}

class _MyContainerWidgetState extends State<MyContainerWidget> {
  // todo-double-tap-01: create a variable size for zoom instantly and add fixedSize for specific size

  // todo-scale-01: create a variable scale for zoom
  @override
  Widget build(BuildContext context) {
    // todo-double-tap-02: wrap with GestureDetector

    // todo-double-tap-03: add onDoubleTap callback and set the baseSize

    // todo-scale-02: wrap this widget with Transform.scale and add scale parameter

    // todo-scale-03: add some callback for scale the GestureDetector widget

    // todo-scale-04: set scale value to default on onDoubleTap callback
    return Image.asset(
      "assets/cat.jpeg",
      fit: BoxFit.cover,
      // todo-double-tap-04: change width and height into the baseSize variable
      height: 150,
      width: 150,
    );
  }
}
