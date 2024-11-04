import 'package:flutter/material.dart';
import 'package:lifecycle_app/my_stateful_widget_page.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  void _nextPage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyStatefulWidget(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My Stateless Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed this button to go to MyStatefulWidget page',
            ),
            FloatingActionButton.small(
              heroTag: "btn_next_to_stateful_widget",
              onPressed: () => _nextPage(context),
              tooltip: 'Next',
              child: const Icon(Icons.next_plan_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
