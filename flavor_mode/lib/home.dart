import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flavor Mode"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Belajar Flutter Flavor dan Flutter Mode",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26),
            ),
            Divider(height: 32, thickness: 2),
          ],
        ),
      ),
    );
  }
}
