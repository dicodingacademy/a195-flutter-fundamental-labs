import 'package:flavor_mode/flavor_config.dart';
import 'package:flavor_mode/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlavorConfig.instance.values.titleApp,
      theme: ThemeData(
        primarySwatch: FlavorConfig.instance.color,
      ),
      home: const Home(),
    );
  }
}
