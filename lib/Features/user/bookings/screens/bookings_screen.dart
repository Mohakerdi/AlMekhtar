import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/notifications/services/cubit/notifications_cubit.dart';
import 'package:mabeet/Features/user/notifications/services/data/notification_repo.dart';
import 'package:mabeet/Features/user/notifications/services/data/notification_webservices.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/core/widgets/CustomAppBar.dart';
import 'package:mabeet/data/repos/booking_repo.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import '../../../../core/constants/strings.dart';
import 'bookings_list_screen.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = BookingCubit(
          bookingRepository: BookingRepository(api: DioConsumer(dio: Dio())),
          noticubit: NotificationCubit(
            NotificationRepo(
              NotificationWebServices(api: DioConsumer(dio: Dio())),
            ),
          ),
        );
        return cubit;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: CustomAppBar(titleText: AppStrings.bookings.tr()),
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: AppStrings.pending.tr()),
                  Tab(text: AppStrings.active.tr()),
                  Tab(text: AppStrings.history.tr()),
                ],
                indicatorColor: AppColors.primary800,
                labelColor: AppColors.primary800,
                unselectedLabelColor: AppColors.gray400,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Pending
                    BookingListScreen(type: BookingType.pending),
                    // Active
                    BookingListScreen(type: BookingType.active),
                    // History
                    BookingListScreen(type: BookingType.history),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
