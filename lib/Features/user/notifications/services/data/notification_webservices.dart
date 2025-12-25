import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/api/api_consumer.dart';

class NotificationWebServices {
  final ApiConsumer api;
  NotificationWebServices({required this.api});

  Future<dynamic> getNotifications() async {
    return await api.get(ApiConstants.notifications);
  }
}
