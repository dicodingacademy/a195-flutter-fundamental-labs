import 'package:calculator_app/providers/math_provider.dart';
import 'package:calculator_app/services/math_expression.dart';
import 'package:calculator_app/static/evaluate_formula_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMathExpression extends Mock implements MathExpression {}

void main() {
  late MockMathExpression mathExpression;
  late MathProvider mathProvider;
  const String successFormula = "3*25";
  const String failureFormula = "math";
  const String resultOfSuccess = "75.0";
  const String resultOfError = "Cannot evaluate that formula.";

  setUp(() {
    mathExpression = MockMathExpression();
    mathProvider = MathProvider(mathExpression);
  });

  group("math provider", () {
    test('should return null when provider initialize.', () {
      final initState = mathProvider.state;

      expect(initState, null);
    });

    test('should return SuccessEvaluate type when formula is right.', () async {
      // arrange
      when(() => mathExpression.evaluate(successFormula))
          .thenReturn(resultOfSuccess);

      // act
      mathProvider.evaluate(successFormula);
      final state = mathProvider.state;

      // assert
      expect(state, isA<SuccessEvaluate>());
    });

    test('should return 75 when formula is right.', () async {
      // arrange
      when(() => mathExpression.evaluate(successFormula))
          .thenReturn(resultOfSuccess);

      // act
      mathProvider.evaluate(successFormula);
      final state = mathProvider.state;

      // assert
      expect(state, equals(SuccessEvaluate(resultOfSuccess)));
    });

    test('should return FailedEvaluate type when formula is wrong.', () {
      when(() => mathExpression.evaluate(failureFormula))
          .thenThrow(resultOfError);

      mathProvider.evaluate(failureFormula);

      final state = mathProvider.state;
      expect(state, isA<FailedEvaluate>());
    });

    test(
        'should return "Cannot evaluate that formula." Error when formula is wrong.',
        () {
      when(() => mathExpression.evaluate(failureFormula))
          .thenThrow(resultOfError);

      mathProvider.evaluate(failureFormula);

      final state = mathProvider.state;
      expect(state, FailedEvaluate(resultOfError));
    });
  });
}
