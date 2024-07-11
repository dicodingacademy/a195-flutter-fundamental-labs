import 'package:calculator_app/services/math_expression.dart';
import 'package:calculator_app/static/evaluate_formula_state.dart';
import 'package:flutter/widgets.dart';

class MathProvider extends ChangeNotifier {
  final MathExpression _mathExpression;

  MathProvider(this._mathExpression);

  EvaluateFormulaState? _state;

  EvaluateFormulaState? get state => _state;

  void evaluate(String formula) {
    try {
      final value = _mathExpression.evaluate(formula);
      _state = SuccessEvaluate(value);
      notifyListeners();
    } catch (e) {
      _state = FailedEvaluate(e.toString());
      notifyListeners();
    }
  }
}
