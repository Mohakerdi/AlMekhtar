import 'package:mabeet/data/models/property.dart';

abstract class PropertyState {}

class PropertyInitial extends PropertyState {}

class PropertyLoading extends PropertyState {}

class PropertyLoaded extends PropertyState {}

class PropertyError extends PropertyState {
  final String message;
  PropertyError(this.message);
}
