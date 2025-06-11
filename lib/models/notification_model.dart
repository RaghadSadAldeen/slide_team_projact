class NotificationModel {
  final String id;
  final String title;
  final String description;
  final DateTime receivedAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.receivedAt,
  });
}
