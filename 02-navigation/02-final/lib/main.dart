import 'package:flutter/material.dart';
import 'package:navigation_app/another_screen.dart';
import 'package:navigation_app/first_screen.dart';
import 'package:navigation_app/replacement_screen.dart';
import 'package:navigation_app/return_data_screen.dart';
import 'package:navigation_app/second_screen.dart';
import 'package:navigation_app/second_screen_with_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
        '/second-with-data': (context) => SecondScreenWithData(
              data: ModalRoute.of(context)?.settings.arguments as String,
            ),
        '/return-data': (context) => const ReturnDataScreen(),
        '/replacement': (context) => const ReplacementScreen(),
        '/another': (context) => const AnotherScreen(),
      },
    );
  }
}
