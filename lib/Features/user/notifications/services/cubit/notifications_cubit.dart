import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/notifications/services/cubit/notifications_state.dart';
import 'package:mabeet/Features/user/notifications/services/data/notification_repo.dart';
import 'package:mabeet/core/notifications_service/notification_mapper.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo repo;
  NotificationCubit(this.repo) : super(NotificationInitial());

  Future<void> getNotifications({bool showFirstAsLocal = false}) async {
    emit(NotificationLoading());

    try {
      final notifications = await repo.fetchNotifications();

      emit(NotificationLoaded(notifications));

      /// 🔔 Show the latest notification in the device's notification shade
      if (showFirstAsLocal && notifications.isNotEmpty) {
        final first = notifications.first;
        first.showAsLocalNotification();
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
