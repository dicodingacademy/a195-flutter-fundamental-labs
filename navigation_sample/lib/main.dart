import 'package:flutter/material.dart';
import 'package:navigation_sample/another_screen.dart';
import 'package:navigation_sample/first_screen.dart';
import 'package:navigation_sample/not_found_screen.dart';
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
      // routes: {
      //   '/': (context) => FirstScreen(),
      //   '/secondScreen': (context) => SecondScreen(),
      //   '/secondScreenWithData': (context) => SecondScreenWithData(
      //       ModalRoute.of(context)?.settings.arguments as String),
      //   '/returnDataScreen': (context) => ReturnDataScreen(),
      //   '/replacementScreen': (context) => ReplacementScreen(),
      //   '/anotherScreen': (context) => AnotherScreen(),
      // },
      onGenerateRoute: (settings) {
        // route /
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => FirstScreen(),
            settings: settings,
          );
        }
        // route /secondScreen
        if (settings.name == '/secondScreen') {
          return MaterialPageRoute(
            builder: (context) => SecondScreen(),
            settings: settings,
          );
        }
        // route /secondScreenWithData
        if (settings.name == '/secondScreenWithData') {
          final String data = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => SecondScreenWithData(data),
            settings: settings,
          );
        }
        // route /returnDataScreen
        if (settings.name == '/returnDataScreen') {
          return MaterialPageRoute(
            builder: (context) => ReturnDataScreen(),
            settings: settings,
          );
        }
        // route /replacementScreen
        if (settings.name == '/replacementScreen') {
          return MaterialPageRoute(
            builder: (context) => ReplacementScreen(),
            settings: settings,
          );
        }
        // route /anotherScreen
        if (settings.name == '/anotherScreen') {
          return MaterialPageRoute(
            builder: (context) => AnotherScreen(),
            settings: settings,
          );
        }

        return MaterialPageRoute(
          builder: (context) => NotFoundScreen(),
          settings: settings,
        );
      },
    );
  }
}
