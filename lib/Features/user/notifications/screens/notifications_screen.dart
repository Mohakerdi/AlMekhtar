import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:mabeet/Features/user/notifications/services/data/notification_repo.dart';
import 'package:mabeet/Features/user/notifications/services/data/notification_webservices.dart';
import 'package:mabeet/Features/user/notifications/widgets/notification_shimmer.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/Features/user/notifications/services/cubit/notifications_cubit.dart';
import 'package:mabeet/Features/user/notifications/services/cubit/notifications_state.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationCubit>(
      create: (context) {
        final dio = Dio();

        final cubit = NotificationCubit(
          NotificationRepo(NotificationWebServices(api: DioConsumer(dio: dio))),
        );
        cubit.getNotifications();

        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Notifications")),

        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const NotificationShimmerItem();
                },
              );
            }
            if (state is NotificationError) {
              return Center(child: Text(state.message));
            }
            if (state is NotificationLoaded) {
              final cards = state.notifications;

              if (cards.isEmpty) {
                return const Center(child: Text("No notifications yet"));
              }
              return ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final item = cards[index];
                  // Ensure your Notification model has a DateTime field named 'date'
                  final formattedDate = DateFormat.yMMMd().format(item.date);
                  return Card(
                    margin: const EdgeInsets.all(10),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.gray300,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primary700.withAlpha(30),
                        child: const Icon(
                          Icons.notifications,
                          color: AppColors.primary600,
                        ),
                      ),
                      title: Text(item.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (item.message.isNotEmpty) Text(item.message),
                          Text(
                            "Date: $formattedDate",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
