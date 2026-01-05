import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/core/widgets/CustomAppBar.dart';
import 'package:mabeet/data/repos/booking_repo.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'bookings_list_screen.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = BookingCubit(
          bookingRepository: BookingRepository(api: DioConsumer(dio: Dio())),
        );
        return cubit;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: const CustomAppBar(titleText: 'Bookings'),
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: "Pending"),
                  Tab(text: "Active"),
                  Tab(text: "History"),
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
