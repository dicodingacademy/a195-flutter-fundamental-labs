import 'dart:ui';

import 'package:flutter/material.dart';

import 'my_stateful_widget_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // todo-app-01: create listener
  late final AppLifecycleListener _listener;

  // todo-app-02: initialize the AppLifecycleListener class and pass callbacks
  @override
  void initState() {
    _listener = AppLifecycleListener(
      onDetach: () => debugPrint('app-detached'),
      onInactive: () => debugPrint('app-inactive'),
      onPause: () => debugPrint('app-paused'),
      onResume: () => debugPrint('app-resumed'),
      onRestart: () => debugPrint('app-restarted'),
      onShow: () => debugPrint("app-showed"),
      onHide: () => debugPrint("app-hide"),
      // todo-app-04: add onExitRequested in listener
      onExitRequested: _onExitRequested,
    );

    super.initState();
  }

  // todo-app-03: create a alert dialog when app is exit
  Future<AppExitResponse> _onExitRequested() async {
    final response = await showDialog<AppExitResponse>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('Are you sure you want to quit this app?'),
        content: const Text('All unsaved progress will be lost.'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.cancel);
            },
          ),
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.exit);
            },
          ),
        ],
      ),
    );

    return response ?? AppExitResponse.exit;
  }

  // todo-app-05: do not forget to dispose the listener
  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lifecycle App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyStatefulWidget(),
    );
  }
}
