import 'package:flutter/material.dart';
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
    final String avatarUrl = booking.profileModel?.avatarUrl ?? '';
    final String propertyImageUrl = booking.apartment?.imageURLs.isNotEmpty == true
        ? booking.apartment!.imageURLs.first
        : '';

    final bool isPending = booking.enStatus == 'Pending';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Apartment Info ---
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:  NetworkImage(propertyImageUrl) as ImageProvider,
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    booking.propertyTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Divider(height: 15),

            Text(
              'Renter: ${booking.renterName}',
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            if (booking.phone != null)
              Text(
                'Phone: ${booking.phone}',
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start: ${booking.startTerm}'),
                    Text('End: ${booking.endTerm}'),
                  ],
                ),
                Text(
                  'Status: ${booking.enStatus}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isPending ? Colors.orange : Colors.green,
                  ),
                ),
              ],
            ),

            if (isPending) ...[
              const Divider(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Accept'),
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