import 'dart:io';

import 'package:mabeet/data/models/state.dart';

abstract class EditPropertyState {}

class EditPropertyInitial extends EditPropertyState {}

class EditPropertyImageSelected extends EditPropertyState {
  final File image;
  EditPropertyImageSelected(this.image);
}

class EditPropertyLoading extends EditPropertyState {}

class EditPropertySuccess extends EditPropertyState {}

class EditPropertyError extends EditPropertyState {
  final String message;
  EditPropertyError(this.message);
}
