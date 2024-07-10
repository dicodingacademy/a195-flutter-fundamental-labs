import 'package:flutter/material.dart';
import 'package:notification_app/providers/payload_provider.dart';
import 'package:notification_app/models/received_notification.dart';
import 'package:notification_app/providers/local_notification_provider.dart';
import 'package:notification_app/services/local_notification_service.dart';
import 'package:notification_app/static/my_route.dart';
import 'package:notification_app/widgets/my_divider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // todo-05-action-02: add functions to handle the notification
  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) {
      context.read<PayloadProvider>().payload = payload;
      Navigator.pushNamed(context, MyRoute.detail.name, arguments: payload);
    });
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationStream.stream
        .listen((ReceivedNotification receivedNotification) {
      final payload = receivedNotification.payload;
      context.read<PayloadProvider>().payload = payload;
      Navigator.pushNamed(context, MyRoute.detail.name,
          arguments: receivedNotification.payload);
    });
  }

  // todo-05-action-03: add initState to run the function
  @override
  void initState() {
    super.initState();
    _configureSelectNotificationSubject();
    _configureDidReceiveLocalNotificationSubject();
  }

  // todo-05-action-04: add dispose to close the stream
  @override
  void dispose() {
    selectNotificationStream.close();
    didReceiveLocalNotificationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyDivider(title: "Notification"),
              ElevatedButton(
                onPressed: () async {
                  await _requestPermission();
                },
                // todo-05-action-05: consume the permission state
                child: Consumer<LocalNotificationProvider>(
                  builder: (context, value, child) {
                    return Text(
                      "Request permission! (${value.permission})",
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _showNotification();
                },
                child: const Text(
                  "Show notification with payload and custom sound",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _showBigPictureNotification();
                },
                child: const Text(
                  "Show notification with big picture",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _scheduleDailyTenAMNotification();
                },
                child: const Text(
                  "Schedule daily 10:00:00 am notification",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _checkPendingNotificationRequests();
                },
                child: const Text(
                  "Check pending notifications",
                  textAlign: TextAlign.center,
                ),
              ),
              const MyDivider(title: "Background Service"),
              ElevatedButton(
                onPressed: () {
                  _runBackgroudOneOffTask();
                },
                child: const Text(
                  "Run a task in background",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _runBackgroudPeriodicTask();
                },
                child: const Text(
                  "Run a task periodically in background",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _cancelAllTaskInBackground();
                },
                child: const Text(
                  "Cancel all task in background",
                  textAlign: TextAlign.center,
                ),
              ),
              const MyDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _requestPermission() async {
    // todo-05-action-06: run the request action
    context.read<LocalNotificationProvider>().requestPermissions();
  }

  Future<void> _showNotification() async {
    // todo-05-action-07: run the notification
    context.read<LocalNotificationProvider>().showNotification();
  }

  Future<void> _showBigPictureNotification() async {}

  Future<void> _scheduleDailyTenAMNotification() async {}

  Future<void> _checkPendingNotificationRequests() async {}

  void _runBackgroudOneOffTask() async {}

  void _runBackgroudPeriodicTask() async {}

  void _cancelAllTaskInBackground() async {}
}
