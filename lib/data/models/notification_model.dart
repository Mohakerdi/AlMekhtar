class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime date;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) {

    return NotificationModel(
      id: json['id'].toString(),


      title: json['title'] ?? 'No Title',
      message: json['message'] ?? '',
      date: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }
}
