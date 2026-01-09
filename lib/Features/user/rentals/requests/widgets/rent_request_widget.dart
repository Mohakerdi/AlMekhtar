import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import '../../../../../data/models/booking_model.dart';

class RequestWidget extends StatefulWidget {
  final Booking booking;
  final VoidCallback onAccept, onReject;

  const RequestWidget({
    super.key,
    required this.booking,
    required this.onAccept,
    required this.onReject,
  });

  @override
  State<RequestWidget> createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  @override
  Widget build(BuildContext context) {
    final imageUrls = widget.booking.apartment?.imageURLs;
    final isPending = widget.booking.enStatus == 'Pending';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: (imageUrls != null && imageUrls.isNotEmpty)
                      ? NetworkImage(imageUrls.first)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.booking.propertyTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: widget.booking.renterImage != null
                      ? CachedNetworkImageProvider(
                    ApiConstants.StorageBaseUrl + widget.booking.renterImage!,
                  )
                      : null,
                ),
              ],
            ),
            const Divider(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                  const Icon(AppIcons.profileIcon, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    '${AppStrings.renter.tr()}: ${widget.booking.renterFullName}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: [
                    const Icon(AppIcons.phone, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      '${AppStrings.phone.tr()}: ${widget.booking.phone}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppStrings.start.tr()}: ${widget.booking.startTerm ??
                            '-'}',
                        style: const TextStyle(fontSize: 13),
                      ),
                      Text(
                        '${AppStrings.end.tr()}: ${widget.booking.endTerm ??
                            '-'}',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: (isPending ? AppColors.warning50 : AppColors.success50),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.booking.enStatus.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: isPending ? AppColors.warning700 : AppColors.success700,
                    ),
                  ),
                ),
              ],
            ),

            if (isPending) ...[
              const Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: widget.onReject,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error100,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text(AppStrings.reject.tr()),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: widget.onAccept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success700,
                        foregroundColor: AppColors.success100,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text(AppStrings.accept.tr()),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}