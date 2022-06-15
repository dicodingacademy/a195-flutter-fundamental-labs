import 'package:flutter/material.dart';
import 'package:navigation_sample/another_screen.dart';
import 'package:navigation_sample/first_screen.dart';
import 'package:navigation_sample/not_found_screen.dart';
import 'package:navigation_sample/replacement_screen.dart';
import 'package:navigation_sample/return_data_screen.dart';
import 'package:navigation_sample/second_screen.dart';
import 'package:navigation_sample/second_screen_with_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (context) => const FirstScreen(),
        '/secondScreen': (context) => const SecondScreen(),
        '/secondScreenWithData': (context) => SecondScreenWithData(
            ModalRoute.of(context)?.settings.arguments as String),
        '/returnDataScreen': (context) => const ReturnDataScreen(),
        '/replacementScreen': (context) => const ReplacementScreen(),
        '/anotherScreen': (context) => const AnotherScreen(),
      },
      onGenerateRoute: (settings) {
        // route /
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const FirstScreen(),
            settings: settings,
          );
        }
        // route /secondScreen
        if (settings.name == '/secondScreen') {
          return MaterialPageRoute(
            builder: (context) => const SecondScreen(),
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
            builder: (context) => const ReturnDataScreen(),
            settings: settings,
          );
        }
        // route /replacementScreen
        if (settings.name == '/replacementScreen') {
          return MaterialPageRoute(
            builder: (context) => const ReplacementScreen(),
            settings: settings,
          );
        }
        // route /anotherScreen
        if (settings.name == '/anotherScreen') {
          return MaterialPageRoute(
            builder: (context) => const AnotherScreen(),
            settings: settings,
          );
        }

        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
          settings: settings,
        );
      },
    );
  }
}
