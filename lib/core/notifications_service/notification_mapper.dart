import 'package:mabeet/data/models/notification_model.dart';
import 'local_notification_service.dart';

extension NotificationMapper on NotificationModel {
  void showAsLocalNotification() {
    LocalNotificationService.showNotification(
      id: int.tryParse(id) ?? DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: title,
      body: message,
    );
  }
}
