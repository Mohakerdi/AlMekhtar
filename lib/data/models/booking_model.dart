import 'package:flutter/foundation.dart';
import 'package:mabeet/core/api/api_constants.dart';
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
  final ProfileModel? profileModel;
  final ProfileModel? phone;

  Booking({
    required this.bookingId,
    required this.enType,
    required this.enStatus,
    required this.rate,
    required this.startTerm,
    required this.endTerm,
    this.apartment,
    this.profileModel,
    this.phone,
  });

  String get propertyTitle {
    return apartment?.title ?? 'Deleted Property';
  }

  String get renterName {
    return '${profileModel!.firstName} ${profileModel!.lastName}';
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    final propertyJson = json['apartment'] as Map<String, dynamic>?;
    return Booking(
      bookingId: json['booking_id'] as int,
      enType: json['enType'] as String,
      enStatus: json['enStatus'] as String,
      rate: json['rate'] as String,
      startTerm: json['startTerm'] as String,
      endTerm: json['endTerm'] as String,
      apartment: propertyJson != null ? Property.fromJson(propertyJson) : null,
    );
  }
}
