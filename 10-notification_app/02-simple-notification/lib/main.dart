import 'package:flutter/material.dart';
import 'package:notification_app/providers/payload_provider.dart';
import 'package:notification_app/providers/local_notification_provider.dart';
import 'package:notification_app/screens/detail_screen.dart';
import 'package:notification_app/screens/home_screen.dart';
import 'package:notification_app/services/local_notification_service.dart';
import 'package:notification_app/static/my_route.dart';
import 'package:provider/provider.dart';

void main() async {
  // todo-05-action-08: define a getNotificationAppLaunchDetails
  WidgetsFlutterBinding.ensureInitialized();

  final notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  // todo-05-action-09: re-route the navigation if there is a payload
  String route = MyRoute.home.name;
  String? payload;

  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    final notificationResponse =
        notificationAppLaunchDetails!.notificationResponse;
    route = MyRoute.detail.name;
    payload = notificationResponse?.payload;
  }

  runApp(
    MultiProvider(
      providers: [
        // todo-03-service-08: inject to the main widget
        Provider(
          create: (context) => LocalNotificationService()..init(),
        ),
        // todo-04-provider-06: inject to the main widget
        ChangeNotifierProvider(
          create: (context) => LocalNotificationProvider(
            context.read<LocalNotificationService>(),
          )..requestPermissions(),
        ),
        // todo-05-action-10: inject the payload
        ChangeNotifierProvider(
          create: (context) => PayloadProvider(
            payload: payload,
          ),
        ),
      ],
      child: App(
        initialRoute: route,
      ),
    ),
  );
}

class App extends StatelessWidget {
  final String initialRoute;

  const App({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        MyRoute.home.name: (context) => const HomeScreen(),
        MyRoute.detail.name: (context) => const DetailScreen(),
      },
    );
  }
}
