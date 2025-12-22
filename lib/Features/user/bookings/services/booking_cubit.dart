import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  void loadBookings() async {
    emit(BookingLoading());

    try {
      await Future.delayed(Duration(seconds: 2));

      //throw Exception('Failed to load bookings');

      List<Property> bookings = dummyProperties;
      emit(BookingLoaded(bookings));
    } catch (e) {
      emit(BookingError('Failed to load bookings'));
    }
  }
}
