import 'dart:io';

abstract class AddPropertyState {}

class AddPropertyInitial extends AddPropertyState {}

class AddPropertyImagesUpdated extends AddPropertyState {
}

class AddPropertyLoading extends AddPropertyState {}

class AddPropertySuccess extends AddPropertyState {
  final String message;
  AddPropertySuccess({required this.message});
}

class AddPropertyError extends AddPropertyState {
  final String message;
  AddPropertyError(this.message);
}

class AddPropertyLocationUpdated extends AddPropertyState {
  final String state;
  final String city;

  AddPropertyLocationUpdated({
    required this.state,
    required this.city,
  });
}
