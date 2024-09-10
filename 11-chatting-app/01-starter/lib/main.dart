import 'package:chatting_app/provider/shared_preference_provider.dart';
import 'package:chatting_app/screens/chat_screen.dart';
import 'package:chatting_app/screens/login_screen.dart';
import 'package:chatting_app/screens/register_screen.dart';
import 'package:chatting_app/services/shared_preferences_service.dart';
import 'package:chatting_app/static/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      Provider(
        create: (context) => SharedPreferencesService(pref),
      ),
      ChangeNotifierProvider(
        create: (context) => SharedPreferenceProvider(
          context.read<SharedPreferencesService>(),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: ScreenRoute.login.name,
      routes: {
        ScreenRoute.login.name: (context) => const LoginScreen(),
        ScreenRoute.register.name: (context) => const RegisterScreen(),
        ScreenRoute.chat.name: (context) => const ChatScreen(),
      },
    );
  }
}
