import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/Features/user/bookings/widgets/rating_dialog.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class RatingButton extends StatelessWidget {
  final int propertyId;

  const RatingButton({super.key, required this.propertyId});

  void _showRatingDialog(BuildContext context, int id) {
    final bookingCubit = context.read<BookingCubit>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: bookingCubit,
          child: RatingDialog(propertyId: id),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 80,
        height: 32,
        child: ElevatedButton.icon(
          onPressed: () {
            _showRatingDialog(context, propertyId);
          },
          icon: const Icon(AppIcons.star, size: 15),
          label: Text(
            AppStrings.rate.tr(),
            style: AppTextStyles.bodySmallMedium,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary700,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          ),
        ),
      ),
    );
  }
}
