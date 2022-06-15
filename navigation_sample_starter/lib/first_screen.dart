import 'package:flutter/material.dart';

/// first_screen.dart
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation & Routing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Go to Second Screen'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text('Navigation with Data'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text('Return Data from Another Screen'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text('Replace Screen'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
