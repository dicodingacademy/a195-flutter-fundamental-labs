import 'package:calculator_app/calculator_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robot/evaluate_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("integrate all feature", (tester) async {
    final evaluateRobot = EvaluateRobot(tester);

    // load ui
    await evaluateRobot.loadUI(const CalculatorApp());

    // typing a right formula and execute it
    await evaluateRobot.typeFormula("3*25");
    await evaluateRobot.tapButton();
    await evaluateRobot.checkResultText("75.0");

    // typing a wrong formula and execute it
    await evaluateRobot.typeFormula("Math");
    await evaluateRobot.tapButton();
    await evaluateRobot.checkResultText("Cannot evaluate that formula.");
  });
}
