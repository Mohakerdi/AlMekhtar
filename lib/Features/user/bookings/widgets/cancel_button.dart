import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/core/theme/app_colors.dart';

import '../../../../core/constants/icons.dart';

class CancelBookingButton extends StatelessWidget {
  final int bookingId;
  final String status;

  const CancelBookingButton({
    super.key,
    required this.bookingId,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool canCancel = status != 'Finished' && status != 'Cancelled';

    if (!canCancel) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 80,
        child: OutlinedButton(
          onPressed: () => _handleCancel(context),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.error700,
            side: const BorderSide(color: AppColors.error700),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(4),
          ),
          child: const Icon(AppIcons.exitIcon, size: 20),
        ),
      ),
    );
  }

  void _handleCancel(BuildContext context) {
    final cubit = context.read<BookingCubit>();

    cubit.cancelBooking(bookingId).then((successMessage) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(successMessage),
            backgroundColor: AppColors.success700,
          ),
        );
      }
    }).catchError((error) {

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: AppColors.error700,
          ),
        );
      }
    });
  }
}
