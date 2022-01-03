import 'package:flutter/material.dart';
import 'package:flavor_mode/flavor_config.dart';
import 'package:flavor_mode/my_app.dart';

void main() {
  FlavorConfig(
    flavor: FlavorType.qa,
    color: Colors.purple,
    values: const FlavorValues(
      titleApp: "QA App",
    ),
  );

  runApp(const MyApp());
}
