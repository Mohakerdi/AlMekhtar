import 'package:mabeet/Features/user/notifications/services/data/notification_webservices.dart';
import 'package:mabeet/data/models/notification_model.dart';

class NotificationRepo {
  final NotificationWebServices webServices;
  NotificationRepo(this.webServices);

  Future<List<NotificationModel>> fetchNotifications() async {
    final response = await webServices.getNotifications();
    print(" NOTIFICATION DATA: $response");
    final dynamic rawData = response['data']?['data'];

    if (rawData is List) {
      return rawData.map((json) => NotificationModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
