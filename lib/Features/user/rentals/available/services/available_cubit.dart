import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/rentals/available/services/available_state.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class AvailableCubit extends Cubit<AvailableState> {
  AvailableCubit() : super(AvailableInitial());

  void loadAvailable() async {
    emit(AvailableLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      //throw Exception('Failed to load bookings');

      List<Property> available = dummyProperties;
      emit(AvailableLoaded(available));
    } catch (e) {
      emit(AvailableError('Failed to load available rentals'));
    }
  }
}
