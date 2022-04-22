import 'package:dicodingacademy/provider/done_module_provider.dart';
import 'package:dicodingacademy/ui/module_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<DoneModuleProvider>(
      create: (context) => DoneModuleProvider(),
      child: const MaterialApp(
        home: ModulePage(),
      ),
    );

void main() {
  group('Module List Page Widget Test', () {
    testWidgets('Testing if ListView shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Test Done Button', (tester) async {
      // Me-render widget
      await tester.pumpWidget(createHomeScreen());
      // Mencari ElevatedButtin pertama kemudian melakukan gestur tap
      await tester.tap(find.byType(ElevatedButton).first);
      // Rebuild tampilan karena perubahan state
      await tester.pumpAndSettle();
      // Verifikasi apakah ditemukan 2 ikon done (Termasuk ikon done yang berada di AppBar)
      expect(find.byIcon(Icons.done), findsNWidgets(2));
    });
  });
}
