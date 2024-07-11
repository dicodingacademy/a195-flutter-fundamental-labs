import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function()? onPressed;

  const ActionButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.comfortable,
      ),
      child: const Text("Execute"),
    );
  }
}
