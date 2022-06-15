import 'package:dicodingacademy/provider/done_module_provider.dart';
import 'package:dicodingacademy/ui/done_module_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

late DoneModuleProvider provider;

Widget createDoneModulePage() => ChangeNotifierProvider(
      create: (context) {
        provider = DoneModuleProvider();
        addItems();
        return provider;
      },
      child: const MaterialApp(
        home: DoneModuleList(),
      ),
    );

void addItems() {
  var testModule1 = 'Test Module 1';
  var testModule2 = 'Test Module 2';

  provider.complete(testModule1);
  provider.complete(testModule2);
}

void main() {
  group('Done Module List Tests', () {
    testWidgets('Test if ListView shows up', (tester) async {
      await tester.pumpWidget(createDoneModulePage());
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Test if items added', (tester) async {
      await tester.pumpWidget(createDoneModulePage());
      await tester.pumpAndSettle();
      var totalItems = tester.elementList(find.byType(ListTile)).length;
      expect(2, totalItems);
    });
  });
}
