import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:simple_android_alarm_manager/ui/home_page.dart';
import 'package:simple_android_alarm_manager/utils/background_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BackgroundService.initializeIsolate();
  AndroidAlarmManager.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'Simple Alarm Manager';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: HomePage(title: title),
    );
  }
}
