import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final String? title;

  const MyDivider({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox.square(dimension: 16),
        const Divider(),
        if (title != null) ...[
          Text(
            title.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox.square(dimension: 16),
        ]
      ],
    );
  }
}
