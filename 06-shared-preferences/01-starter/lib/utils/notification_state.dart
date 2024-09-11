enum NotificationState {
  enable,
  disable;

  bool get isEnable => this == NotificationState.enable;
}
