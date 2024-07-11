import 'package:calculator_app/services/math_expression.dart';
import 'package:test/test.dart';

void main() {
  late MathExpression mathExpression;

  setUp(() {
    mathExpression = MathExpression();
  });

  group("math expression", () {
    test('should return 75.0 when the formula is "3*25".', () {
      const String formula = "3*25";

      final eval = mathExpression.evaluate(formula);

      expect(eval, "75.0");
    });

    test(
        'should return throw "Cannot evaluate that formula." when the formula is "math".',
        () {
      const String formula = "math";

      evalFunc() => mathExpression.evaluate(formula);

      expect(evalFunc, throwsA("Cannot evaluate that formula."));
    });
  });
}
