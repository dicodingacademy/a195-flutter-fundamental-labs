import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/provider/shared_preferences_provider.dart';
import 'package:shared_preferences_app/screen/profile_screen.dart';
import 'package:shared_preferences_app/services/shared_preferences_service.dart';
import 'package:shared_preferences_app/static/route_observer.dart';

void main() async {
  // todo-02-provider-07: make the main is async, add widget binding, and get an access to shared preference.
  WidgetsFlutterBinding.ensureInitialized();
  final shared = await SharedPreferences.getInstance();
  // todo-02-provider-08: register the share preference provider
  runApp(MultiProvider(
    providers: [
      Provider (
        create: (context) => SharedPreferencesService(shared),
      ),
      ChangeNotifierProvider(
        create: (context) => SharedPreferencesProvider(
          context.read<SharedPreferencesService>(),
        ),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
      // todo-04-observer-02: register the observer to navigator observer
      navigatorObservers: [
        observer,
      ],
    );
  }
}
