import 'package:flutter/material.dart';
import 'package:notification_app/providers/payload_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // todo-05-action-11: update a payload
    // todo-05-action-12: clean and build the project, then run the app
    final data = context.read<PayloadProvider>().payload;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Payload: $data",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go back!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
