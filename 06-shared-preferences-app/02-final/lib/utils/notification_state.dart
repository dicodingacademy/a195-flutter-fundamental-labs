enum NotificationState {
  enable,
  disable;

  bool get isEnable => this == NotificationState.enable;
}

extension BoolExtension on bool {
  NotificationState get isEnable =>
      this == true ? NotificationState.enable : NotificationState.disable;
}
