import 'package:flutter/material.dart';

class FormulaField extends StatelessWidget {
  const FormulaField({
    super.key,
    required this.tecFormula,
  });

  final TextEditingController tecFormula;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
        ),
      ),
      child: TextFormField(
        controller: tecFormula,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8),
          hintText: "Write a formula.",
        ),
        style: const TextStyle(
          fontSize: 32,
        ),
        maxLines: 3,
        minLines: 3,
      ),
    );
  }
}
