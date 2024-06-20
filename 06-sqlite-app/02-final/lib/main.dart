import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_app/provider/local_database_provider.dart';
import 'package:sqlite_app/screen/profiles_screen.dart';
import 'package:sqlite_app/services/sqlite_service.dart';

void main() {
  // todo-02-provider-09: register the share preference provider
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (context) => SqliteService(),
      ),
      ChangeNotifierProvider(
        create: (context) => LocalDatabaseProvider(
          context.read<SqliteService>(),
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
      title: 'SQLite App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfilesScreen(),
    );
  }
}
