import 'package:flutter/widgets.dart';

// todo-05-action-01: create a state to hold the payload
class PayloadProvider extends ChangeNotifier {
  String? payload;

  PayloadProvider({
    this.payload,
  });
}
