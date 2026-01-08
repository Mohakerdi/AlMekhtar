import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/core/api/api_constants.dart';
import '../../../../../data/models/booking_model.dart';

class RequestWidget extends StatelessWidget {
  final Booking booking;
  final VoidCallback onAccept;

  const RequestWidget({
    super.key,
    required this.booking,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrls = booking.apartment?.imageURLs;
    final hasImage = imageUrls != null && imageUrls.isNotEmpty;
    final isPending = booking.enStatus == 'Pending';

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
                  backgroundImage: NetworkImage(imageUrls!.first),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    booking.propertyTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: CachedNetworkImageProvider(ApiConstants.StorageBaseUrl+booking.renterImage!),
                ),
              ],
            ),
            const Divider(height: 20),

            Text(
              'Renter: ${booking.renterFullName ?? 'Unknown'}',
              style: const TextStyle(fontSize: 14),
            ),

            if (booking.phone != null)
              Text(
                'Phone: ${booking.phone}',
                style: const TextStyle(fontSize: 14),
              ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start: ${booking.startTerm ?? '-'}'),
                    Text('End: ${booking.endTerm ?? '-'}'),
                  ],
                ),
                Text(
                  booking.enStatus ?? 'Unknown',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isPending ? Colors.orange : Colors.green,
                  ),
                ),
              ],
            ),

            if (isPending) ...[
              const Divider(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Accept'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
