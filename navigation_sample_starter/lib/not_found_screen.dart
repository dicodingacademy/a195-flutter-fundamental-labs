import 'package:flutter/material.dart';

/// not_found_screen.dart
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '404',
              style: TextStyle(fontSize: 40),
            ),
            Text('Page Not Found'),
          ],
        ),
      ),
    );
  }
}
