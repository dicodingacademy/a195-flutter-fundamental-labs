import 'package:flutter/material.dart';

/// replacement_screen.dart
class ReplacementScreen extends StatelessWidget {
  const ReplacementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Another Screen'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/anotherScreen');
          },
        ),
      ),
    );
  }
}
