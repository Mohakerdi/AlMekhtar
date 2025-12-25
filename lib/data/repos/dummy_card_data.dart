import 'package:mabeet/data/models/notification_model.dart';

final List<NotificationModel> dummyCards = [
  NotificationModel(
    id: "1",
    title: "Meeting with Client",
    date: DateTime.now().add(Duration(days: 1)),
    message: 'asd',
  ),
  NotificationModel(
    id: "2",
    title: "Project Deadline",
    date: DateTime(2025, 12, 10),
    message: 'sdf',
  ),
  NotificationModel(
    id: "3",
    title: "Team Lunch",
    date: DateTime.now().subtract(Duration(days: 2)),
    message: 'sdf',
  ),
  NotificationModel(
    id: "4",
    title: "Code Review",
    date: DateTime(2025, 12, 15, 14, 30),
    message: 'i',
  ),
];
