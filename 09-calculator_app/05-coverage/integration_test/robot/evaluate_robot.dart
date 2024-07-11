import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class EvaluateRobot {
  final WidgetTester tester;

  const EvaluateRobot(
    this.tester,
  );

  final formulaFieldKey = const ValueKey("formulaField");
  final actionButtonKey = const ValueKey("actionButton");
  final resultKey = const ValueKey("result");

  Future<void> loadUI(Widget widget) async {
    await tester.pumpWidget(widget);
  }

  Future<void> typeFormula(String formula) async {
    final formulaFieldFinder = find.byKey(formulaFieldKey);
    await tester.tap(formulaFieldFinder);
    await tester.enterText(formulaFieldFinder, formula);
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future<void> tapButton() async {
    final actionButtonFinder = find.byKey(actionButtonKey);
    await tester.tap(actionButtonFinder);
    await tester.pump();
  }

  Future<void> checkResultText(String result) async {
    final resultFidner = find.byKey(resultKey);
    final resultWidget = tester.widget<Text>(resultFidner);
    expect(resultWidget.data, result);
  }
}
