import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/payment/cubit/payment_cubit.dart';
import 'package:mabeet/Features/user/bookings/payment/cubit/payment_state.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/data/models/booking_model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditBookingDialog extends StatefulWidget {
  final Booking booking;
  final double costPerNight;

  const EditBookingDialog({
    super.key,
    required this.booking,
    required this.costPerNight,
  });

  @override
  State<EditBookingDialog> createState() => _EditBookingDialogState();
}

class _EditBookingDialogState extends State<EditBookingDialog> {
  DateTime? start;
  DateTime? end;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaymentCubit>();

    return AlertDialog(
      title: Text(AppStrings.edit.tr()),
      content: SizedBox(
        width: double.maxFinite,
        height: 420,
        child: Column(
          children: [
            /// DATE PICKER
            Expanded(
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                minDate: DateTime.now(),
                onSelectionChanged: (args) {
                  if (args.value is PickerDateRange) {
                    final range = args.value as PickerDateRange;
                    if (range.startDate != null && range.endDate != null) {
                      start = range.startDate!;
                      end = range.endDate!;

                      cubit.updateDates(
                        start: start!,
                        end: end!,
                        costPerNight: widget.costPerNight,
                      );
                    }
                  }
                },
              ),
            ),

            const SizedBox(height: 12),

            /// PRICE PREVIEW
            BlocBuilder<PaymentCubit, PaymentState>(
              buildWhen: (prev, curr) => curr is PaymentPriceUpdated,
              builder: (context, state) {
                if (state is PaymentPriceUpdated) {
                  return Column(
                    children: [
                      Text('${state.nights} ${AppStrings.night.tr()}'),
                      Text(
                        '\$${state.total}',
                        style: AppTextStyles.titleMedium,
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),

      /// ACTIONS
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppStrings.cancel.tr()),
        ),

        BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is PaymentFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state is PaymentLoading
                  ? null
                  : () {
                      cubit.saveCardDetails(); // if already entered
                      cubit.submitEditBooking(
                        bookingId: widget.booking.bookingId,
                      );
                    },
              child: state is PaymentLoading
                  ? const CircularProgressIndicator()
                  : Text(AppStrings.submit.tr()),
            );
          },
        ),
      ],
    );
  }
}
