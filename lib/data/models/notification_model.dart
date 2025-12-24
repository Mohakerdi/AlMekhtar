class NotificationModel {
  final String title;
  final DateTime date;
  final String id;
  NotificationModel({
    required this.title,
    required this.date,
    required this.id,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'].toString(),

      title: json['title'] ?? '',

      date:
          DateTime.tryParse(json['date'] ?? json['created_at'] ?? '') ??
          DateTime.now(),
    );
  }
}
