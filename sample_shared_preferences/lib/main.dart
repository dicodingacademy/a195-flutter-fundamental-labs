import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String counterNumberPrefs = 'counterNumber';

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _saveNumber();
    });
  }

  void _saveNumber() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(counterNumberPrefs, _counter);
  }

  void _loadNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(counterNumberPrefs) ?? 0;
    });
  }

  void _resetNumber() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(counterNumberPrefs);
  _loadNumber();
}

  @override
  void initState() {
    super.initState();
    _loadNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            OutlinedButton(
              onPressed: _resetNumber,
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
