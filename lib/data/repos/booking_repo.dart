import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:mabeet/data/models/booking_model.dart';

class BookingRepository {
  final ApiConsumer api;

  BookingRepository({required this.api});

  Future<List<Booking>> getPendingAwaitingBookings() async {
    try {
      final response = await api.get(ApiConstants.renterPending);
      final List<dynamic> data = response[ApiKey.data] ?? [];
      return data
          .map((json) => Booking.fromJson(json as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    }
  }

  Future<List<Booking>> getActiveAcceptedBookings() async {
    try {
      final response = await api.get(ApiConstants.renterActive);
      final List<dynamic> data = response[ApiKey.data] ?? [];
      return data
          .map((json) => Booking.fromJson(json as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    }
  }

  Future<List<Booking>> getHistoryBookings() async {
    try {
      final response = await api.get(ApiConstants.renterHistory);
      final List<dynamic> data = response[ApiKey.data] ?? [];
      return data
          .map((json) => Booking.fromJson(json as Map<String, dynamic>))
          .toList();
    } on ServerException {
      rethrow;
    }
  }

  Future<List<Booking>> getAllBookings() async {
    try {
      final pending = await getPendingAwaitingBookings();
      final active = await getActiveAcceptedBookings();
      final history = await getHistoryBookings();
      return [...pending, ...active, ...history];
    } on ServerException {
      rethrow;
    }
  }

  Future<String> cancelBooking(int bookingId) async {
    try {
      final endpoint = 'apartments/reservations/$bookingId/cancel';
      final response = await api.post(endpoint, data: {});
      final message = response[ApiKey.message] as String;

      return message;
    } on ServerException {
      rethrow;
    }
  }
}

enum BookingType { pending, active, history }
