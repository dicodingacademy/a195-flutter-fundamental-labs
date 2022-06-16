import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dicodingacademy/main.dart' as app;

void main() {
  group('Testing App', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Done module test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final keys = [
        'Modul 1 - Pengenalan Dart',
        'Modul 2 - Memulai Pemrograman dengan Dart',
        'Modul 3 - Dart Fundamental',
      ];

      for (var key in keys) {
        await tester.tap(find.byKey(Key(key)));
      }

      await tester.tap(find.byKey(const Key('done_page_button')));

      final listFinder = find.byType(ListView);
      final firstItem = find.text('Modul 1 - Pengenalan Dart');

      await tester.scrollUntilVisible(listFinder, 5000);
      expect(firstItem, findsOneWidget);

      await binding.traceAction(
        () async {
          await tester.scrollUntilVisible(listFinder, 5000);
          expect(firstItem, findsOneWidget);
        },
      );
    });
  });
}
