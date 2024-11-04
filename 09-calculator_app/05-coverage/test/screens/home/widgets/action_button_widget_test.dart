import 'package:calculator_app/screens/home/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late bool isButtonClicked;

  late Widget widgetClickable;

  late Widget widgetNonClickable;

  setUp(() {
    isButtonClicked = false;
    widgetClickable = MaterialApp(
      home: ActionButton(
        onPressed: () {
          isButtonClicked = true;
        },
      ),
    );

    widgetNonClickable = const MaterialApp(
      home: ActionButton(
        onPressed: null,
      ),
    );
  });

  group("action button widget", () {
    testWidgets('must have a text, namely "Execute"', (tester) async {
      await tester.pumpWidget(widgetClickable);

      final text = find.text("Execute");

      expect(text, findsOneWidget);
    });

    testWidgets('have to be a FilledButton type', (tester) async {
      await tester.pumpWidget(widgetClickable);

      final button = find.byType(FilledButton);

      expect(button, findsOneWidget);
    });

    testWidgets('must have a button with styles', (tester) async {
      final widget = MaterialApp(
        home: ActionButton(
          onPressed: () {},
        ),
      );

      await tester.pumpWidget(widget);

      final filledButtonFinder = find.byType(FilledButton);
      final filledButton = tester.widget<FilledButton>(filledButtonFinder);

      const tapTargetSize = MaterialTapTargetSize.padded;
      const visualDensity = VisualDensity.comfortable;

      expect(filledButton.style?.tapTargetSize, tapTargetSize);
      expect(filledButton.style?.visualDensity, visualDensity);
    });

    testWidgets('must clickable', (tester) async {
      await tester.pumpWidget(widgetClickable);

      final button = find.byType(FilledButton);

      await tester.tap(button);
      await tester.pump();

      expect(isButtonClicked, true);
    });

    testWidgets('should be non-clickable', (tester) async {
      await tester.pumpWidget(widgetNonClickable);

      final button = find.byType(FilledButton);

      await tester.tap(button);
      await tester.pump();

      expect(isButtonClicked, false);
    });
  });
}
