import 'package:mabeet/data/models/notification_model.dart';

final List<NotificationModel> dummyCards = [
  NotificationModel(
    id: "1",
    title: "Meeting with Client",
    date: DateTime.now().add(Duration(days: 1)),
  ),
  NotificationModel(
    id: "2",
    title: "Project Deadline",
    date: DateTime(2025, 12, 10),
  ),
  NotificationModel(
    id: "3",
    title: "Team Lunch",
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  NotificationModel(
    id: "4",
    title: "Code Review",
    date: DateTime(2025, 12, 15, 14, 30),
  ),
];
