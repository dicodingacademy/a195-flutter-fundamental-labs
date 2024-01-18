import 'package:flutter/material.dart';
import 'package:sliver_app/screen/learning_path_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // todo-04: remove a MyHomePage widget and replace home parameter on Material App with LearningPathScreen
      home: const LearningPathScreen(),
    );
  }
}
