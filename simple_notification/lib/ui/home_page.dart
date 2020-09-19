import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_notification/ui/detail_page.dart';
import 'package:simple_notification/main.dart';
import 'package:simple_notification/utils/notification_helper.dart';
import 'package:simple_notification/widget/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    notificationHelper.configureSelectNotificationSubject(
        context, DetailPage.routeName);
    notificationHelper.configureDidReceiveLocalNotificationSubject(
        context, DetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    didReceiveLocalNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Notification'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                CustomButton(
                  text: 'Show plain notification with payload',
                  onPressed: () async {
                    await notificationHelper
                        .showNotification(flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Show plain notification that has no body with payload',
                  onPressed: () async {
                    await notificationHelper.showNotificationWithNoBody(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Show schedule notification with payload',
                  onPressed: () async {
                    await notificationHelper
                        .scheduleNotification(flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text:
                      'Show notification that times out after 3 seconds [Android]',
                  onPressed: () async {
                    await notificationHelper.showTimeoutNotification(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Show grouped notifications [Android]',
                  onPressed: () async {
                    await notificationHelper.showGroupedNotifications(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text:
                      'Show progress notification - updates every second [Android]',
                  onPressed: () async {
                    await notificationHelper.showProgressNotification(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Show big picture notification [Android]',
                  onPressed: () async {
                    await notificationHelper.showBigPictureNotification(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Show notification with attachment [iOS]',
                  onPressed: () async {
                    await notificationHelper.showNotificationWithAttachment(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Show inbox notification [Android]',
                  onPressed: () async {
                    await notificationHelper
                        .showInboxNotification(flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Delete notification channel [Android]',
                  onPressed: () async {
                    await notificationHelper.deleteNotificationChannel(
                        flutterLocalNotificationsPlugin, context);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Cancel notification',
                  onPressed: () async {
                    await notificationHelper
                        .cancelNotification(flutterLocalNotificationsPlugin);
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Cancel all notification',
                  onPressed: () async {
                    await notificationHelper.cancelAllNotifications(
                        flutterLocalNotificationsPlugin);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
