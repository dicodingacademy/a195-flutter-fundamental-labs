import 'package:flutter/material.dart';

import 'my_stateful_widget_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // todo-app-01: create listener

  // todo-app-02: initialize the AppLifecycleListener class and pass callbacks
  // todo-app-04: add onExitRequested in listener

  // todo-app-03: create a alert dialog when app is exit

  // todo-app-05: do not forget to dispose the listener

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lifecycle App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyStatefulWidget(),
    );
  }
}
