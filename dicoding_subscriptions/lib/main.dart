import 'package:dicoding_subscriptions/home.dart';
import 'package:dicoding_subscriptions/localization_provider.dart';
import 'package:flutter/material.dart';
// todo localizations-1 6: add library common.dart
import 'package:dicoding_subscriptions/common.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo localizations-2 3: add provider to MaterialApp
    return ChangeNotifierProvider<LocalizationProvider>(
      create: (context) => LocalizationProvider(),
      builder: (context, child) {
        // todo localizations-2 4: add provider variabel
        final provider = Provider.of<LocalizationProvider>(context);
        return MaterialApp(
          title: 'Flutter Localization & Accessibility',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            scaffoldBackgroundColor: Colors.grey.shade50,
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey.shade800,
                onPrimary: Colors.white,
              ),
            ),
          ),
          // todo localizations-1 7: add parameter localizationsDelegates and supportedLocales
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // todo localizations-2 5: add locale parameter and give provider value
          locale: provider.locale,
          home: const HomePage(),
        );
      },
    );
    // return MaterialApp(
    //   title: 'Flutter Localization & Accessibility',
    //   theme: ThemeData(
    //     appBarTheme: const AppBarTheme(
    //       backgroundColor: Colors.white,
    //       foregroundColor: Colors.black,
    //     ),
    //     scaffoldBackgroundColor: Colors.grey.shade50,
    //     outlinedButtonTheme: OutlinedButtonThemeData(
    //       style: ElevatedButton.styleFrom(
    //         primary: Colors.blueGrey.shade800,
    //         onPrimary: Colors.white,
    //       ),
    //     ),
    //   ),
    //   // todo localizations-1 7: add parameter localizationsDelegates and supportedLocales
    //   // localizationsDelegates: AppLocalizations.localizationsDelegates,
    //   // supportedLocales: AppLocalizations.supportedLocales,
    //   localizationsDelegates: const [
    //     AppLocalizations.delegate,
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //     GlobalCupertinoLocalizations.delegate,
    //   ],
    //   supportedLocales: const [
    //     Locale('id', ''),
    //     Locale('en', ''),
    //     Locale('ar', ''),
    //   ],
    //   home: const HomePage(),
    // );
  }
}
