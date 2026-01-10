import 'package:easy_localization/easy_localization.dart';

import 'property.dart';

class Booking {
  final int bookingId;
  final String enType;
  final String enStatus;
  final rate;
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

    String status = json['enStatus'] as String;
    final now = DateFormat('yyyy-MM-d').format(DateTime.now());
    final start = json['startTerm'] as String;
    final end = json['endTerm'] as String;
    if (status == "Accepted") {
      if (now.compareTo(start) >= 0 && now.compareTo(end) <= 0) {
        status = "Active";
      }
      else if(now.compareTo(end)>0){
        status = "Finished";
      }
    }

    return Booking(
      bookingId: json['booking_id'] as int,
      enType: json['enType'] as String,
      enStatus: status,
      rate: json['rate'] is String ? 0.0 : json['rate'],
      startTerm: start,
      endTerm: end,
      apartment: propertyJson != null ? Property.fromJson(propertyJson) : null,
      phone: userJson?['phone'],
      renterFullName:
          profileJson?['firstName'] + ' ' + profileJson?['lastName'],
      renterImage: profileJson?['avatar'],
    );
  }
}
