import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Testing App Performance', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('Scrolling test', () async {
      final listFinder = find.byType('ListView');

      final scrollingTimeline = await driver.traceAction(() async {
        await driver.scroll(listFinder, 0, -1000, Duration(seconds: 1));
        await driver.scroll(listFinder, 0, 1000, Duration(seconds: 1));
      });

      final scrollingSummary = TimelineSummary.summarize(scrollingTimeline);
      await scrollingSummary.writeSummaryToFile('scrolling', pretty: true);
      await scrollingSummary.writeTimelineToFile('scrolling', pretty: true);
    });

    test('Favorites operations test', () async {
      final operationsTimeline = await driver.traceAction(() async {
        final keys = [
          'Modul 1 - Pengenalan Dart',
          'Modul 2 - Memulai Pemrograman dengan Dart',
          'Modul 3 - Dart Fundamental',
        ];

        for (var key in keys) {
          await driver.tap(find.byValueKey(key));
        }

        await driver.tap(find.byValueKey('done_button'));

        await driver.waitFor(find.text('Modul 1 - Pengenalan Dart'));
        await driver
            .waitFor(find.text('Modul 2 - Memulai Pemrograman dengan Dart'));
        await driver.waitFor(find.text('Modul 3 - Dart Fundamental'));
      });

      final operationsSummary = TimelineSummary.summarize(operationsTimeline);
      await operationsSummary.writeSummaryToFile('favorites_operations',
          pretty: true);
      await operationsSummary.writeTimelineToFile('favorites_operations',
          pretty: true);
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });
  });
}
