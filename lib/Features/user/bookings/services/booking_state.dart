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

class RateBookingLoading extends BookingState {}

class RateBookingSuccess extends BookingState {
  final String message;
  RateBookingSuccess(this.message);
}

class RateBookingError extends BookingState {
  final String message;
  RateBookingError(this.message);
}

class EditBookingLoading extends BookingState {}

class EditBookingSuccess extends BookingState {
  final String message;
  EditBookingSuccess(this.message);
}

class EditBookingError extends BookingState {
  final String message;
  EditBookingError(this.message);
}
