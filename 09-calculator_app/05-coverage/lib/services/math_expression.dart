import 'package:math_expressions/math_expressions.dart';

class MathExpression {
  final Parser parser = Parser();
  final ContextModel cm = ContextModel();

  String evaluate(String formula) {
    try {
      final expression = parser.parse(formula);
      final result = expression.evaluate(EvaluationType.REAL, cm);
      return result.toString();
    } catch (e) {
      throw "Cannot evaluate that formula.";
    }
  }
}
