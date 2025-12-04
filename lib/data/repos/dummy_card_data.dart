import 'package:mabeet/data/models/card_model.dart';

final List<CardModel> dummyCards = [
  CardModel(
    id: "1",
    title: "Meeting with Client",
    date: DateTime.now().add(Duration(days: 1)),
  ),
  CardModel(id: "2", title: "Project Deadline", date: DateTime(2025, 12, 10)),
  CardModel(
    id: "3",
    title: "Team Lunch",
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  CardModel(
    id: "4",
    title: "Code Review",
    date: DateTime(2025, 12, 15, 14, 30),
  ),
];
