import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/Features/user/bookings/services/booking_state.dart';
import 'package:mabeet/Features/user/bookings/widgets/booking_property.dart';
import 'package:mabeet/Features/user/CustomAppBar.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingCubit()..loadBookings(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Bookings'),
        body: BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state is BookingError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is BookingLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Bookings loaded successfully!'),
                  backgroundColor: AppColors.primary700,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookingLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.bookings.length,
                itemBuilder: (context, index) {
                  final property = state.bookings[index];
                  return BookingProperty(property: property);
                },
              );
            } else if (state is BookingError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

/*class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Bookings'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyProperties.length,
        itemBuilder: (context, index) {
          final property = dummyProperties[index];
          return BookingProperty(property: property);
        },
      ),
    );
  }
}*/
