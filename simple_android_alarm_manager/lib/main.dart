import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:simple_android_alarm_manager/ui/home_page.dart';
import 'package:simple_android_alarm_manager/utils/background_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final BackgroundService service = BackgroundService();

  service.initializeIsolate();
  AndroidAlarmManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'Simple Alarm Manager';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      home: HomePage(title: title),
    );
  }
}
