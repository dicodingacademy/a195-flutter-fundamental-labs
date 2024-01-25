// todo-init-02: remove all necessary class and change with all of this code
import 'package:file_app/provider/file_provider.dart';
import 'package:file_app/screen/home_screen.dart';
import 'package:file_app/service/file_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // todo-provider-07: register the provider
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (context) => FileService(),
      ),
      ChangeNotifierProvider(
        create: (context) => FileProvider(
          context.read<FileService>(),
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
      home: const HomeScreen(),
    );
  }
}

// todo-init-03: move this widget to different file
// dont forget to import home screen to main.dart file
/*
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomeScreen'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is a text.',
            ),
          ],
        ),
      ),
    );
  }
}
*/
