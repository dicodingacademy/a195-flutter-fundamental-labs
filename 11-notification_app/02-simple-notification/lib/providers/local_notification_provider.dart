import 'package:flutter/widgets.dart';
import 'package:notification_app/services/local_notification_service.dart';

// todo-04-provider-01: create a provider
class LocalNotificationProvider extends ChangeNotifier {
  // todo-04-provider-02: add constructor
  final LocalNotificationService flutterNotificationService;

  LocalNotificationProvider(this.flutterNotificationService);

  // todo-04-provider-03: add a state to maintain the data
  int _notificationId = 0;
  bool? _permission = false;
  bool? get permission => _permission;

  // todo-04-provider-04: add permission function
  Future<void> requestPermissions() async {
    _permission = await flutterNotificationService.requestPermissions();
    notifyListeners();
  }

  // todo-04-provider-05: add showNotification function
  void showNotification() {
    _notificationId += 1;
    flutterNotificationService.showNotification(
      id: _notificationId,
      title: "New Notification",
      body: "This is a new notification with id $_notificationId",
      payload: "This is a payload from notification with id $_notificationId",
    );
  }
}
