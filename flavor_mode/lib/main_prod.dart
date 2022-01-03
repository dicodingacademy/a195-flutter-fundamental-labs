import 'package:flutter/material.dart';
import 'package:flavor_mode/flavor_config.dart';
import 'package:flavor_mode/my_app.dart';

void main() {
  FlavorConfig(
    flavor: FlavorType.prod,
    color: Colors.blue,
    values: const FlavorValues(
      titleApp: "Production App",
    ),
  );

  runApp(const MyApp());
}
