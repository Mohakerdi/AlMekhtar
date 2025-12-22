abstract class RentalsState {}

class RentalsInitial extends RentalsState {}

class RentalsLoading extends RentalsState {}

class RentalsLoaded extends RentalsState {
  final List<dynamic> rentals;
  RentalsLoaded(this.rentals);
}

class RentalsError extends RentalsState {
  final String message;
  RentalsError(this.message);
}

//class RentAdd extends RentalsState {}
