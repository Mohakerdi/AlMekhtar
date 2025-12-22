import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/rentals/services/rentals_state.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class RentalsCubit extends Cubit<RentalsState> {
  RentalsCubit() : super(RentalsInitial());


  void loadRentals() async {
    emit(RentalsLoading());

    try {
      await Future.delayed(Duration(seconds: 2));

      //throw Exception('Failed to load bookings');

      List<Property> rentals = dummyProperties;
      emit(RentalsLoaded(rentals));
    } catch (e) {
      emit(RentalsError('Failed to load rentals'));
    }
  }
}
