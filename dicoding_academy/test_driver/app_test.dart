import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Testing App', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('Done module test', () async {
      final keys = [
        'Modul 1 - Pengenalan Dart',
        'Modul 2 - Memulai Pemrograman dengan Dart',
        'Modul 3 - Dart Fundamental',
      ];

      for (var key in keys) {
        await driver.tap(find.byValueKey(key));
      }

      await driver.tap(find.byValueKey('done_page_button'));

      final listFinder = find.byType('ListView');
      final firstItem = find.text('Modul 1 - Pengenalan Dart');
      final secondItem = find.text('Modul 2 - Memulai Pemrograman dengan Dart');
      final thirdItem = find.text('Modul 3 - Dart Fundamental');

      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(listFinder, firstItem, dyScroll: -300);
        await driver.scrollUntilVisible(listFinder, secondItem, dyScroll: -300);
        await driver.scrollUntilVisible(listFinder, thirdItem, dyScroll: -300);

        expect(await driver.getText(firstItem), 'Modul 1 - Pengenalan Dart');
        expect(await driver.getText(secondItem),
            'Modul 2 - Memulai Pemrograman dengan Dart');
        expect(await driver.getText(thirdItem), 'Modul 3 - Dart Fundamental');
      });

      final summary = TimelineSummary.summarize(timeline);
      await summary.writeSummaryToFile('done_module', pretty: true);
      await summary.writeTimelineToFile('done_module', pretty: true);
    });

    tearDownAll(() async {
      await driver.close();
    });
  });
}
