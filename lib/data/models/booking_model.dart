import 'package:mabeet/data/models/profile_model.dart';

import 'property.dart';

class Booking {
  final int bookingId;
  final String enType;
  final String enStatus;
  final String rate;
  final String startTerm;
  final String endTerm;
  final Property? apartment;
  final String? renterFullName;
  final String? phone;
  final String? renterImage;

  Booking({
    required this.bookingId,
    required this.enType,
    required this.enStatus,
    required this.rate,
    required this.startTerm,
    required this.endTerm,
    this.apartment,
    this.renterFullName,
    this.phone,
    this.renterImage,
  });

  String get propertyTitle {
    return apartment?.title ?? 'Deleted Property';
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    final propertyJson = json['apartment'] as Map<String, dynamic>?;
    final userJson = json['user'] as Map<String, dynamic>?;
    final profileJson = userJson?['profile'] as Map<String, dynamic>?;

    return Booking(
      bookingId: json['booking_id'] as int,
      enType: json['enType'] as String,
      enStatus: json['enStatus'] as String,
      rate: json['rate'] as String,
      startTerm: json['startTerm'] as String,
      endTerm: json['endTerm'] as String,
      apartment: propertyJson != null ? Property.fromJson(propertyJson) : null,
      phone: userJson?['phone'],
      renterFullName: profileJson?['firstName'] +' '+ profileJson?['lastName'],
      renterImage: profileJson?['avatar']
    );
  }
}
