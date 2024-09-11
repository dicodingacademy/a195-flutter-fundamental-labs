import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/providers/notification_state_provider.dart';
import 'package:shared_preferences_app/providers/shared_preferences_provider.dart';
import 'package:shared_preferences_app/screens/setting_page.dart';
import 'package:shared_preferences_app/services/shared_preferences_service.dart';

void main() async {
  // todo-02-provider-07: make the main is async, add widget binding, and get an access to shared preference.
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // todo-02-provider-08: register the share preference provider
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NotificationStateProvider(),
      ),
      Provider(
        create: (context) => SharedPreferencesService(prefs),
      ),
      ChangeNotifierProvider(
        create: (context) => SharedPreferencesProvider(
          context.read<SharedPreferencesService>(),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SettingPage(),
    );
  }
}
