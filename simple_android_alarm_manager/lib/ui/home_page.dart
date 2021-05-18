import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:simple_android_alarm_manager/utils/background_service.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({required this.title});

  @override
  _HomePageState createState() => _HomePageState();
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
              child: Text(
                'Alarm with Delayed (Once)',
              ),
              onPressed: () async {
                await AndroidAlarmManager.oneShot(
                  Duration(seconds: 5),
                  1,
                  BackgroundService.callback,
                  exact: true,
                  wakeup: true,
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Alarm with Date and Time (Once)',
              ),
              onPressed: () async {
                await AndroidAlarmManager.oneShotAt(
                  DateTime.now().add(Duration(seconds: 5)),
                  2,
                  BackgroundService.callback,
                  exact: true,
                  wakeup: true,
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Alarm with Periodic',
              ),
              onPressed: () async {
                await AndroidAlarmManager.periodic(
                  Duration(minutes: 1),
                  3,
                  BackgroundService.callback,
                  startAt: DateTime.now(),
                  exact: true,
                  wakeup: true,
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
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
