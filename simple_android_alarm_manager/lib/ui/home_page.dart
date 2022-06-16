import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:simple_android_alarm_manager/utils/background_service.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BackgroundService _service = BackgroundService();

  @override
  void initState() {
    super.initState();
    port.listen((_) async => await _service.someTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text(
                'Alarm with Delayed (Once)',
              ),
              onPressed: () async {
                await AndroidAlarmManager.oneShot(
                  const Duration(seconds: 5),
                  1,
                  BackgroundService.callback,
                  exact: true,
                  wakeup: true,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'Alarm with Date and Time (Once)',
              ),
              onPressed: () async {
                await AndroidAlarmManager.oneShotAt(
                  DateTime.now().add(const Duration(seconds: 5)),
                  2,
                  BackgroundService.callback,
                  exact: true,
                  wakeup: true,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'Alarm with Periodic',
              ),
              onPressed: () async {
                await AndroidAlarmManager.periodic(
                  const Duration(minutes: 1),
                  3,
                  BackgroundService.callback,
                  startAt: DateTime.now(),
                  exact: true,
                  wakeup: true,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'Cancel Alarm by Id',
              ),
              onPressed: () async {
                await AndroidAlarmManager.cancel(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
