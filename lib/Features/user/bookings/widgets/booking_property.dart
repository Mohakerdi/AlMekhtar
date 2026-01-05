import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/Features/user/property/screens/property_screen.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/booking_model.dart';

class BookingProperty extends StatelessWidget {
  const BookingProperty({super.key, required this.booking});

  final Booking booking;

  void _goToPropertyScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => PropertyScreen(property: booking.apartment),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String locationName =
        '${booking.apartment.state.name}, ${booking.apartment.city}';

    return InkWell(
      onTap: () => _goToPropertyScreen(context),
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
                            imageUrl: booking.apartment.imageURLs[0],
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
                                booking.apartment.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: booking.enStatus == 'Pending' || booking.enStatus == 'AwaitingPayment'
                                    ? AppColors.warning50
                                    : booking.enStatus == 'Active'|| booking.enStatus == 'Accepted'
                                    ? AppColors.success50
                                    : AppColors.error50,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                booking.enStatus,
                                style: textTheme.labelSmall!.copyWith(
                                  color: booking.enStatus == 'Pending'|| booking.enStatus == 'AwaitingPayment'
                                      ? AppColors.warning700
                                      : booking.enStatus == 'Active'|| booking.enStatus == 'Accepted'
                                      ? AppColors.success700
                                      : AppColors.error700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
                              '\$${booking.apartment.costPerNight}/night',
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
                                  '${booking.apartment.avgRate}',
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
          'Booking Period:',
          style: textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.gray300,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDateChip(context, AppIcons.startDate, 'Start:', startTerm),
            _buildDateChip(context, AppIcons.endDate, 'End:', endTerm),
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
              // Use the actual success message from the API response
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
