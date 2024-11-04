import 'package:calculator_app/screens/home/widgets/formula_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const key = Key("FormulaField");
  late TextEditingController textEditingController;
  late Widget widget;

  setUp(() {
    textEditingController = TextEditingController();
    widget = MaterialApp(
      home: Material(
        child: FormulaField(
          key: key,
          tecFormula: textEditingController,
        ),
      ),
    );
  });

  group('formula field widget', () {
    testWidgets("have a DecoratedBox and TextFormField", (tester) async {
      await tester.pumpWidget(widget);

      final decoratedBox = find.byType(DecoratedBox);
      final textFormField = find.byType(TextFormField);

      expect(decoratedBox, findsOneWidget);
      expect(textFormField, findsOneWidget);
    });

    testWidgets("have a DecoratedBox with styles", (tester) async {
      await tester.pumpWidget(widget);

      final decoratedBoxFinder = find.byType(DecoratedBox);
      final decoratedBox = tester.widget<DecoratedBox>(decoratedBoxFinder);

      final border = Border.all(width: 2);
      final borderRadius = BorderRadius.circular(10);

      final boxDecoration = (decoratedBox.decoration as BoxDecoration);

      expect(boxDecoration.border, border);
      expect(boxDecoration.borderRadius, borderRadius);
    });

    testWidgets(
        "have a TextFormField with styles, like placeholder text and size",
        (tester) async {
      const String hintPlaceholder = "Write a formula.";
      const int fontSize =  32;

      await tester.pumpWidget(widget);


      final textFormFieldFinder = find.byType(TextField);
      final textFormFieldWidget = tester.widget<TextField>(textFormFieldFinder);

      expect(textFormFieldWidget.decoration?.hintText, hintPlaceholder);
      expect(textFormFieldWidget.style?.fontSize, fontSize);
      expect(textFormFieldWidget.maxLines, 3);
      expect(textFormFieldWidget.minLines, 3);
    });

    testWidgets("have to write some text", (tester) async {
      const text = "2*2";
      await tester.pumpWidget(widget);

      final textFormField = find.byType(TextFormField);

      await tester.enterText(textFormField, text);

      expect(textEditingController.text, text);
    });
  });
}
