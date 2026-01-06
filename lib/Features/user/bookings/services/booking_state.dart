import 'package:mabeet/data/models/booking_model.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final List<Booking> pendingBookings;
  final List<Booking> activeBookings;
  final List<Booking> historyBookings;

  BookingLoaded({
    required this.pendingBookings,
    required this.activeBookings,
    required this.historyBookings,
  });
}


class BookingError extends BookingState {
  final String message;
  BookingError(this.message);
}
