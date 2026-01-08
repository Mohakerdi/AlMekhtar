import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/Features/user/property/screens/property_screen.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/booking_model.dart';
import 'package:mabeet/data/models/property.dart';

class BookingProperty extends StatelessWidget {
  const BookingProperty({super.key, required this.booking});

  final Booking booking;

  void _goToPropertyScreen(BuildContext context, Property? apartment) {
    if (apartment != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => PropertyScreen(property: apartment, isOwner: false,),
        ),
      );
    }
  }

  Widget _buildDeletedPropertyCard(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deleted Property',
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.error700,
                  ),
                ),
                _buildStatusChip(textTheme, booking.enStatus),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'This property is no longer available or has been removed by the owner.',
              style: textTheme.bodyMedium!.copyWith(color: AppColors.gray600),
            ),
            const SizedBox(height: 12),
            _buildDateSection(context, booking.startTerm, booking.endTerm),
            if (booking.enStatus != 'Finished' && booking.enStatus != 'Cancelled')
              _buildCancelButton(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final apartment = booking.apartment;
    if (apartment == null) {
      return _buildDeletedPropertyCard(context);
    }
    final String locationName =
        '${apartment.state.name}, ${apartment.city}';
    return InkWell(
      onTap: () => _goToPropertyScreen(context, apartment),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: apartment.imageURLs[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      _buildCancelButton(context),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                apartment.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            _buildStatusChip(textTheme, booking.enStatus),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              AppIcons.location,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              locationName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall!.copyWith(
                                color: AppColors.gray600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Price
                            Text(
                              '\$${apartment.costPerNight}/${AppStrings.night.tr()}',
                              style: textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary900,
                              ),
                            ),
                            // Rating
                            Row(
                              children: [
                                Icon(
                                  AppIcons.star,
                                  size: 18,
                                  color: AppColors.warning700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${apartment.avgRate}',
                                  style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildDateSection(context, booking.startTerm, booking.endTerm),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(TextTheme textTheme, String status) {
    Color? backgroundColor;
    Color? textColor;

    if (status == 'Pending' || status == 'AwaitingPayment') {
      backgroundColor = AppColors.warning50;
      textColor = AppColors.warning700;
    } else if (status == 'Active' || status == 'Accepted') {
      backgroundColor = AppColors.success50;
      textColor = AppColors.success700;
    } else {
      backgroundColor = AppColors.error50;
      textColor = AppColors.error700;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: textTheme.labelSmall!.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDateSection(
      BuildContext context,
      String startTerm,
      String endTerm,
      ) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          '${AppStrings.period.tr()}: ',
          style: textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.gray300,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDateChip(context, AppIcons.startDate, '${AppStrings.start.tr()}:', startTerm),
            _buildDateChip(context, AppIcons.endDate, '${AppStrings.end.tr()}:', endTerm),
          ],
        ),
      ],
    );
  }

  Widget _buildDateChip(
      BuildContext context,
      IconData icon,
      String label,
      String date,
      ) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.gray700),
        const SizedBox(width: 4),
        Text(
          '$label $date',
          style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    final BookingCubit cubit = context.read<BookingCubit>();
    final bool canCancel =
        booking.enStatus != 'Finished' && booking.enStatus != 'Cancelled';

    if (!canCancel) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 80,
        child: OutlinedButton(
          onPressed: () {
            cubit.cancelBooking(booking.bookingId).then((successMessage) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(successMessage)));
            });
          },
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
}