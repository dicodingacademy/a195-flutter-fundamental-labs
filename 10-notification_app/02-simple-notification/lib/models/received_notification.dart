// todo-03-service-01: create a class to hold the notification value
class ReceivedNotification {
  final int? id;
  final String? title;
  final String? body;
  final String? payload;
 
  ReceivedNotification({
    this.id,
    this.title,
    this.body,
    this.payload,
  });
}