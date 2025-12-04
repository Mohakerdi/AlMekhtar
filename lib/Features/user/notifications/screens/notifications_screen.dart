import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/card_model.dart';
import 'package:mabeet/data/repos/dummy_card_data.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final List<CardModel> cards = dummyCards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ), // Added a title for better UI
      // REMOVED SingleChildScrollView
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final item = cards[index];
          final formattedDate = DateFormat.yMMMd().format(item.date);

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary700.withAlpha(
                  30,
                ), // Light background
                child: Icon(
                  Icons.notifications,
                  color: AppColors.primary600,
                ), // Dark Icon
              ),
              title: Text(item.title),
              subtitle: Text("Date: $formattedDate"),
            ),
          );
        },
      ),
    );
  }
}
