import 'package:calculator_app/providers/math_provider.dart';
import 'package:calculator_app/screens/home/widgets/result_text_widget.dart';
import 'package:calculator_app/static/evaluate_formula_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockMathProvider extends Mock implements MathProvider {}

void main() {
  group('result text widget', () {
    late MockMathProvider mathProvider;
    late Widget widget;

    setUp(() {
      mathProvider = MockMathProvider();
      widget = MaterialApp(
        home: ChangeNotifierProvider<MathProvider>(
          create: (context) => mathProvider,
          child: const ResultText(),
        ),
      );
    });

    testWidgets("should contain Consumer and SizedBox when the state is null",
        (tester) async {
      when(() => mathProvider.state).thenReturn(null);

      await tester.pumpWidget(widget);

      final consumer = find.byType(Consumer<MathProvider>);
      final sizedBox = find.byType(SizedBox);
      final text = find.byType(Text);

      expect(consumer, findsOneWidget);
      expect(sizedBox, findsOneWidget);
      expect(text, findsNothing);
    });

    testWidgets(
        "should contain Consumer and Text when the state is SuccessEvaluate",
        (tester) async {
      when(() => mathProvider.state).thenReturn(SuccessEvaluate("25"));

      await tester.pumpWidget(widget);

      final consumer = find.byType(Consumer<MathProvider>);
      final sizedBox = find.byType(SizedBox);
      final text = find.byType(Text);

      expect(consumer, findsOneWidget);
      expect(text, findsOneWidget);
      expect(sizedBox, findsNothing);
    });

    testWidgets(
        "should contain Consumer and Text when the state is FailedEvaluate",
        (tester) async {
      when(() => mathProvider.state).thenReturn(FailedEvaluate("Error"));

      await tester.pumpWidget(widget);

      final consumer = find.byType(Consumer<MathProvider>);
      final text = find.byType(Text);

      expect(consumer, findsOneWidget);
      expect(text, findsOneWidget);
    });

    testWidgets("have Text with style", (tester) async {
      when(() => mathProvider.state).thenReturn(SuccessEvaluate("25"));

      await tester.pumpWidget(widget);

      final textFinder = find.byType(Text);
      final text = tester.widget<Text>(textFinder);

      const blackColor = Color(0xFF000000);
      const fontSize = 42;
      const fontWeight = FontWeight.bold;
      const textAlign = TextAlign.center;

      expect(text.style?.color, blackColor);
      expect(text.style?.fontSize, fontSize);
      expect(text.style?.fontWeight, fontWeight);
      expect(text.textAlign, textAlign);
    });
  });
}
