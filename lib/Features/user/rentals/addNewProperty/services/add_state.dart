import 'dart:io';

import 'package:mabeet/data/models/state.dart';

abstract class AddPropertyState {}

class AddPropertyInitial extends AddPropertyState {}

class AddPropertyImageSelected extends AddPropertyState {
  final File image;
  AddPropertyImageSelected(this.image);
}

class AddPropertyLoading extends AddPropertyState {}

class AddPropertySuccess extends AddPropertyState {}

class AddPropertyError extends AddPropertyState {
  final String message;
  AddPropertyError(this.message);
}
