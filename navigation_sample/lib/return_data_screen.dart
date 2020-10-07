import 'package:flutter/material.dart';

class ReturnDataScreen extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(labelText: 'Enter your name'),
              ),
            ),
            RaisedButton(
              child: Text('Send'),
              onPressed: () {
                Navigator.pop(context, textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
