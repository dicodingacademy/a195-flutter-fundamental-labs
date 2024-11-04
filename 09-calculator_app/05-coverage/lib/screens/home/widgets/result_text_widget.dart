import 'package:calculator_app/providers/math_provider.dart';
import 'package:calculator_app/static/evaluate_formula_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultText extends StatelessWidget {
  const ResultText({
    super.key,
  });

  final textStyle = const TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<MathProvider>(
      builder: (context, value, child) {
        final text = switch (value.state) {
          SuccessEvaluate(value: var result) => result,
          FailedEvaluate(message: var errorText) => errorText,
          _ => "",
        };
        return switch (text.isNotEmpty) {
          true => Text(
              text,
              key: const ValueKey("result"),
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
