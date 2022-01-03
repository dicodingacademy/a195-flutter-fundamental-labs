import 'package:flavor_mode/flavor_config.dart';
import 'package:flavor_mode/flutter_mode_config.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlavorConfig.instance.values.titleApp),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Text(
              "Belajar Flutter Flavor dan Flutter Mode",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26),
            ),
            const Divider(height: 32, thickness: 2),
            Text(
              "Flavor: ${FlavorConfig.instance.flavor.name}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26),
            ),
            Text(
              "Mode: ${FlutterModeConfig.flutterMode}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
