import 'package:flutter/material.dart';
import 'package:notification_app/providers/payload_provider.dart';
import 'package:notification_app/providers/local_notification_provider.dart';
import 'package:notification_app/services/local_notification_service.dart';
import 'package:notification_app/services/workmanager_service.dart';
import 'package:notification_app/static/my_route.dart';
import 'package:notification_app/widgets/my_divider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) {
      context.read<PayloadProvider>().payload = payload;
      Navigator.pushNamed(context, MyRoute.detail.name, arguments: payload);
    });
  }

  @override
  void initState() {
    super.initState();
    _configureSelectNotificationSubject();
  }

  @override
  void dispose() {
    selectNotificationStream.close();
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
                  _runBackgroundOneOffTask();
                },
                child: const Text(
                  "Run a task in background",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _runBackgroundPeriodicTask();
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
    context.read<LocalNotificationProvider>().requestPermissions();
  }

  Future<void> _showNotification() async {
    context.read<LocalNotificationProvider>().showNotification();
  }

  Future<void> _showBigPictureNotification() async {
    context.read<LocalNotificationProvider>().showBigPictureNotification();
  }

  Future<void> _scheduleDailyTenAMNotification() async {
    context.read<LocalNotificationProvider>().scheduleDailyTenAMNotification();
  }

  Future<void> _checkPendingNotificationRequests() async {
    final localNotificationProvider = context.read<LocalNotificationProvider>();
    await localNotificationProvider.checkPendingNotificationRequests(context);

    if (!mounted) {
      return;
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        final pendingData = context.select(
            (LocalNotificationProvider provider) =>
                provider.pendingNotificationRequests);
        return AlertDialog(
          title: Text(
            '${pendingData.length} pending notification requests',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          content: SizedBox(
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: pendingData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = pendingData[index];
                return ListTile(
                  title: Text(
                    item.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item.body ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  contentPadding: EdgeInsets.zero,
                  trailing: IconButton(
                    onPressed: () {
                      localNotificationProvider
                        ..cancelNotification(item.id)
                        ..checkPendingNotificationRequests(context);
                    },
                    icon: const Icon(Icons.delete_outline),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _runBackgroundOneOffTask() async {
    // todo-02-action-01: run the runOneOffTask function
    context.read<WorkmanagerService>().runOneOffTask();
  }

  void _runBackgroundPeriodicTask() async {
    // todo-02-action-02: run the runPeriodicTask function
    context.read<WorkmanagerService>().runPeriodicTask();
  }

  void _cancelAllTaskInBackground() async {
    // todo-02-action-03: run the cancelAllTask function
    context.read<WorkmanagerService>().cancelAllTask();
  }
}
