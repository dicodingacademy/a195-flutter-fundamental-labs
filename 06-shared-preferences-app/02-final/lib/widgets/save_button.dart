import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function() onPressed;

  const SaveButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilledButton.icon(
        onPressed: onPressed,
        label: const Text("Save"),
        icon: const Icon(Icons.save_as_outlined),
      ),
    );
  }
}
