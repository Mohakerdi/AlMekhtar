import 'property.dart';

class Booking {
  final int bookingId;
  final String enType;
  final String enStatus;
  final String rate;
  final String startTerm;
  final String endTerm;
  final Property apartment;

  Booking({
    required this.bookingId,
    required this.enType,
    required this.enStatus,
    required this.rate,
    required this.startTerm,
    required this.endTerm,
    required this.apartment,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json['booking_id'] as int,
      enType: json['enType'] as String,
      enStatus: json['enStatus'] as String,
      rate: json['rate'] as String,
      startTerm: json['startTerm'] as String,
      endTerm: json['endTerm'] as String,
      apartment: Property.fromJson(json['apartment'] as Map<String, dynamic>),
    );
  }
}