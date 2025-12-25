import 'dart:convert';

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
    final dynamic nestedData = json['data'];

    return NotificationModel(
      id: json['id'].toString(),

      title: nestedData is Map
          ? (nestedData['title'] ?? 'No Title')
          : 'Notification',
      message: nestedData is Map ? (nestedData['message'] ?? '') : '',
      date: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }
}
