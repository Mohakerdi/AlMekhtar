import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/notifications/services/cubit/notifications_state.dart';
import 'package:mabeet/Features/user/notifications/services/data/notification_repo.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo repo;
  NotificationCubit(this.repo) : super(NotificationInitial());

  void getNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await repo.fetchNotifications();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
