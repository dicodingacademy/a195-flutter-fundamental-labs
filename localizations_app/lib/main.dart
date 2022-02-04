import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aplikasi Localizations',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('id', ''),
        Locale('en', ''),
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleApp),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   AppLocalizations.of(context)!.helloWorld("Dicoding"),
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            // Text(
            //   AppLocalizations.of(context)!.address("Bandung", 123),
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Text(
              AppLocalizations.of(context)!.myNumber(123456),
              style: Theme.of(context).textTheme.headline4,
            ),
            // Text(
            //   AppLocalizations.of(context)!.todayDate(DateTime.now()),
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            // Text(
            //   AppLocalizations.of(context)!.myApple(0),
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            // Text(
            //   AppLocalizations.of(context)!.nThings(5, "Buku"),
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
    );
  }
}
