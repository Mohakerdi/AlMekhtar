abstract class RentedState {}

class RentedInitial extends RentedState {}

class RentedLoading extends RentedState {}

class RentedLoaded extends RentedState {
  final List<dynamic> rentals;
  RentedLoaded(this.rentals);
}

class RentedError extends RentedState {
  final String message;
  RentedError(this.message);
}

//class RentAdd extends RentalsState {}
