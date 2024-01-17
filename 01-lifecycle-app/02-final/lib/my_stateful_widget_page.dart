import 'package:flutter/material.dart';
import 'package:lifecycle_app/my_stateless_widget_page.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({
    super.key,
  });

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  // todo-widget-01: override initState method
  @override
  void initState() {
    debugPrint("widget-initState");
    super.initState();
  }

  // todo-widget-04: override setState method
  @override
  void setState(VoidCallback fn) {
    debugPrint("widget-setstate");
    super.setState(fn);
  }

  // todo-widget-06: override dispose method
  @override
  void dispose() {
    debugPrint("widget-dispose");
    super.dispose();
  }

  // todo-widget-02: override didChangeDependencies method
  @override
  void didChangeDependencies() async {
    debugPrint("widget-didChangeDependencies");
    super.didChangeDependencies();
  }

  // todo-widget-05: override deactivate method
  @override
  void deactivate() {
    debugPrint("widget-deactivate");
    super.deactivate();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _nextPage() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyStatelessWidget(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // todo-widget-03: setup for build method
    debugPrint("widget-build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Lifecycle App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton.icon(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: Text("Add this number ($_counter)"),
            ),
            const SizedBox.square(dimension: 20),
            OutlinedButton.icon(
              onPressed: _nextPage,
              icon: const Icon(Icons.next_plan_outlined),
              label: const Text("Replace page to other page"),
            ),
          ],
        ),
      ),
    );
  }
}
