import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:mabeet/data/models/booking_model.dart';

class BookingRepository {
  final ApiConsumer api;

  BookingRepository({required this.api});

  Future<List<Booking>> getPendingAwaitingBookings() async {
    try {
      final response = await api.get('apartments/renter/pending');

      if (response is Map<String, dynamic> && response['data'] is List) {
        final List<dynamic> data = response['data'] ?? [];
        return data.map((json) => Booking.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Invalid response format');
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw Exception('Failed to load pending bookings: $e');
    }
  }

  Future<List<Booking>> getActiveAcceptedBookings() async {
    try {
      final response = await api.get('apartments/renter/active');

      if (response is Map<String, dynamic> && response['data'] is List) {
        final List<dynamic> data = response['data'] ?? [];
        return data.map((json) => Booking.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Invalid response format');
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw Exception('Failed to load active bookings: $e');
    }
  }

  Future<List<Booking>> getHistoryBookings() async {
    try {
      final response = await api.get('apartments/renter/history');

      if (response is Map<String, dynamic> && response['data'] is List) {
        final List<dynamic> data = response['data'] ?? [];
        return data.map((json) => Booking.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Invalid response format');
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw Exception('Failed to load history bookings: $e');
    }
  }

  Future<List<Booking>> getAllBookings() async {
    try {
      final pending = await getPendingAwaitingBookings();
      final active = await getActiveAcceptedBookings();
      final history = await getHistoryBookings();
      return [...pending, ...active, ...history];
    } catch (e) {
      throw Exception('Failed to load all bookings: $e');
    }
  }

  Future<List<Booking>> getBookingsByType(BookingType type) async {
    switch (type) {
      case BookingType.pending:
        return getPendingAwaitingBookings();
      case BookingType.active:
        return getActiveAcceptedBookings();
      case BookingType.history:
        return getHistoryBookings();
    }
  }
}

enum BookingType {
  pending,
  active,
  history,
}