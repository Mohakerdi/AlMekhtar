import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/Features/user/bookings/services/booking_state.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RatingDialog extends StatefulWidget {
  final int propertyId;

  const RatingDialog({super.key, required this.propertyId});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double selectedRating = 5.0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit,BookingState>(
      listener: (context, state) {
        if (state is RateBookingSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.green),
          );
          context.read<BookingCubit>().loadActiveBookings();
        } else if (state is RateBookingError) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
          context.read<BookingCubit>().loadActiveBookings();
        }
      },
      child: AlertDialog(
        title: Text('AppStrings.rateYourBooking.tr()'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${AppStrings.rate.tr()}: ${selectedRating.toStringAsFixed(1)} / 5',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            //
            SfSlider(
              min: 0.0,
              max: 5.0,
              interval: 1.0,
              showTicks: true,
              showLabels: true,
              minorTicksPerInterval: 0,
              value: selectedRating,
              onChanged: (dynamic newValue) {
                setState(() {
                  selectedRating = newValue;
                });
              },
              labelPlacement: LabelPlacement.onTicks,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppStrings.cancel.tr()),
          ),

          ElevatedButton(
            child: Text('AppStrings.submit.tr()'),
            onPressed: () {
              context.read<BookingCubit>().rateBooking(
                widget.propertyId,
                selectedRating,
              );
            },
          ),
        ],
      ),
    );
  }
}
