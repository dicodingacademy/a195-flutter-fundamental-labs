import 'package:flutter/material.dart';
import 'package:navigation_sample/another_screen.dart';
import 'package:navigation_sample/first_screen.dart';
import 'package:navigation_sample/replacement_screen.dart';
import 'package:navigation_sample/return_data_screen.dart';
import 'package:navigation_sample/second_screen.dart';
import 'package:navigation_sample/second_screen_with_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/secondScreen': (context) => SecondScreen(),
        '/secondScreenWithData': (context) => SecondScreenWithData(),
        '/returnDataScreen': (context) => ReturnDataScreen(),
        '/replacementScreen': (context) => ReplacementScreen(),
        '/anotherScreen': (context) => AnotherScreen(),
      },
    );
  }
}
