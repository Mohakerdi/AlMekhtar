import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/payment/cubit/payment_cubit.dart';
import 'package:mabeet/Features/user/bookings/payment/cubit/payment_state.dart';
import 'package:mabeet/Features/user/bookings/payment/screens/payment_screen.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
import '../widgets/rent_now_property_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../data/models/property.dart';

class RentNowScreen extends StatefulWidget {
  final Property property;

  const RentNowScreen({super.key, required this.property});

  @override
  State<RentNowScreen> createState() => _RentNowScreenState();
}

class _RentNowScreenState extends State<RentNowScreen> {
  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 30)),
  );

  bool isChecked = false;

  int get nights {
    return selectedDates.end.difference(selectedDates.start).inDays;
  }

  double get totalPrice {
    return nights * widget.property.costPerNight + 10;
  }

  String formatDatePretty(DateTime date) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return "${date.day} ${months[date.month - 1]}";
  }

  String _maskCardNumber(String fullNumber) {
    if (fullNumber.length < 4) {
      return fullNumber;
    }
    final maskedPart = '*' * (fullNumber.length - 4);
    final lastFour = fullNumber.substring(fullNumber.length - 4);
    final maskedCard = '$maskedPart $lastFour';
    String formattedMasked = '';
    for (int i = 0; i < maskedPart.length; i++) {
      formattedMasked += maskedPart[i];
      if ((i + 1) % 4 == 0) {
        formattedMasked += ' ';
      }
    }

    formattedMasked = formattedMasked.trim();
    return '$formattedMasked $lastFour';
  }

  void _goToPaymentScreen() async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (builder) => const PaymentScreen()));

    setState(() {});
  }

  Widget _buildPaymentMethodTile(String? cardDisplay) {
    if (cardDisplay != null) {
      return ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        leading: Icon(AppIcons.creditCard, size: 35, color: AppColors.primary800),
        title: Text(
          cardDisplay,
          style: TextStyle(color: AppColors.darkText, fontSize: 17),
        ),
        trailing: TextButton(
          onPressed: _goToPaymentScreen,
          child: Text(
            AppStrings.edit.tr(),
            style: TextStyle(color: AppColors.primary800, fontSize: 17),
          ),
        ),
      );
    }

    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5),
      leading: Icon(AppIcons.creditCard, size: 35, color: AppColors.primary800),
      title: Text(
        AppStrings.creditOrDebt.tr(),
        style: TextStyle(color: AppColors.darkText, fontSize: 17),
      ),
      trailing: IconButton(
        icon: Icon(AppIcons.add, color: AppColors.gray500, size: 35),
        onPressed: _goToPaymentScreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentCubit = context.watch<PaymentCubit>();
    final fullSavedCardNumber = paymentCubit.fullSavedCardNumber;
    final displayCardText = fullSavedCardNumber != null
        ? _maskCardNumber(fullSavedCardNumber)
        : null;

    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.errorBase,
            ),
          );
        }

        if (state is PaymentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.primary700,
            ),
          );
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(AppStrings.rentNow.tr())),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RentalsProperty(property: widget.property),
                SizedBox(height: 25),
                Text(
                  AppStrings.period.tr(),
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.date.tr(), style: TextStyle(color: AppColors.gray400)),
                      Text(
                        "${formatDatePretty(selectedDates.start)} - "
                        "${formatDatePretty(selectedDates.end)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  leading: Icon(
                    AppIcons.endDate,
                    size: 35,
                    color: AppColors.primary800,
                  ),

                  trailing: IconButton(
                    icon: Icon(
                      AppIcons.rightArrow,
                      color: AppColors.gray500,
                      size: 35,
                    ),
                    onPressed: () async {
                      final DateTimeRange? pickedRange =
                          await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2025),
                            lastDate: DateTime(3000),
                            initialDateRange: selectedDates,
                            barrierDismissible: true,
                          );

                      if (pickedRange != null) {
                        setState(() {
                          selectedDates = pickedRange;
                        });

                        context.read<PaymentCubit>().updateDates(
                          start: pickedRange.start,
                          end: pickedRange.end,
                          costPerNight: widget.property.costPerNight,
                        );
                      }
                    },
                  ),
                ),
                Divider(),
                Text(
                  AppStrings.checkDate.tr(),
                ),
                SizedBox(height: 25),
                Text(
                  AppStrings.payments.tr(),
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildPaymentMethodTile(displayCardText),
                Divider(),
                SizedBox(height: 5),
                Text(
                  AppStrings.priceDetails.tr(),
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: BlocBuilder<PaymentCubit, PaymentState>(
                    buildWhen: (previous, current) =>
                        current is PaymentPriceUpdated,
                    builder: (context, state) {
                      if (state is PaymentPriceUpdated) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.period.tr()),
                                Text("${state.nights} ${AppStrings.night.tr()}"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.total.tr()),
                                Text(
                                  "\$${state.total.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: AppColors.primary800,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
                Divider(),
                SizedBox(height: 5),
                Text(
                  AppStrings.terms.tr()+AppStrings.and.tr()+AppStrings.conditions.tr(),
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),

                  title: Text(
                    AppStrings.bookingTerms.tr(),
                    style: TextStyle(color: AppColors.darkText, fontSize: 14),
                  ),
                ),

                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,

                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      splashRadius: 15,
                    ),
                    Text(
                      AppStrings.iAgree.tr(),
                      style: TextStyle(color: AppColors.darkText),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (!isChecked) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppStrings.termsNotAgreed.tr()),
                  backgroundColor: AppColors.errorBase,
                ),
              );
              return;
            }
            if (fullSavedCardNumber == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppStrings.cardNotAdded.tr(),
                  ),
                  backgroundColor: AppColors.errorBase,
                ),
              );
              return;
            }

            final cubit = context.read<PaymentCubit>();
            final String start = DateFormat(
              'yyyy-M-d',
            ).format(selectedDates.start);
            final String end = DateFormat('yyyy-M-d').format(selectedDates.end);

            cubit.startTerm = start;
            cubit.endTerm = end;

            cubit.submitOfferPayment(apartmentId: widget.property.propertyId);
          },
          label: Text(AppStrings.confirmBooking.tr()),
          backgroundColor: AppColors.primary700,
          extendedPadding: EdgeInsets.symmetric(horizontal: 30),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
