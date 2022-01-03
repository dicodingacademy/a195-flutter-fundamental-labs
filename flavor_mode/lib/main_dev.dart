import 'package:flutter/material.dart';
import 'package:flavor_mode/flavor_config.dart';
import 'package:flavor_mode/my_app.dart';

void main() {
  FlavorConfig(
    flavor: FlavorType.dev,
    color: Colors.orange,
    values: const FlavorValues(
      titleApp: "Development App",
    ),
  );

  runApp(const MyApp());
}
