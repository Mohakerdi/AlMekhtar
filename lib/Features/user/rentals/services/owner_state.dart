import 'package:mabeet/data/models/booking_model.dart';
import 'package:mabeet/data/models/property.dart';

abstract class OwnerState {}

class OwnerInitial extends OwnerState {}

class OwnerLoading extends OwnerState {}

class OwnerLoaded extends OwnerState {
  final List<Property> myProperties;
  final List<Booking> pendingRequests;
  final List<Booking> contracts;
  OwnerLoaded({
    required this.myProperties,
    this.pendingRequests = const [],
    this.contracts = const [],
  });
}


class OwnerError extends OwnerState {
  final String message;
  OwnerError(this.message);
}
