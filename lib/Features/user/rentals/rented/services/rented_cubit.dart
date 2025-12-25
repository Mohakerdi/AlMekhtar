import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/rentals/rented/services/rented_state.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class RentedCubit extends Cubit<RentedState> {
  RentedCubit() : super(RentedInitial());

  void loadRentals() async {
    emit(RentedLoading());

    try {
      await Future.delayed(Duration(seconds: 2));

      //throw Exception('Failed to load bookings');

      List<Property> rentals = dummyProperties;
      emit(RentedLoaded(rentals));
    } catch (e) {
      emit(RentedError('Failed to load rentals'));
    }
  }
}
