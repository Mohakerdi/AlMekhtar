import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/services/add_state.dart';
import 'package:mabeet/data/models/state.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {
  AddPropertyCubit() : super(AddPropertyInitial());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationDescriptionController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController floorsController = TextEditingController();

  File? selectedImage;

  selectImage(File image) {
    selectedImage = image;
    emit(AddPropertyImageSelected(image));
  }

  void addProperty() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        costController.text.isEmpty ||
        areaController.text.isEmpty ||
        floorsController.text.isEmpty ||
        selectedImage == null) {
      emit(AddPropertyError('Please fill all fields'));
      return;
    }

    emit(AddPropertyLoading());

    /*Property newProperty = Property(
      propertyId: dummyProperties.length + 1,
      title: titleController.text,
      imageURLs: [selectedImage!.path],
      description: descriptionController.text,
      describedLocation: locationDescriptionController.text,
      costPerNight: double.parse(costController.text),
      area: double.parse(areaController.text),
      floor: int.parse(floorsController.text),
      avgRate: 0,
      city: 'Damascus',
      state: Location.Damascus,
    );*/

    //dummyProperties.add(newProperty);

    emit(AddPropertySuccess());
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    locationDescriptionController.dispose();
    costController.dispose();
    areaController.dispose();
    floorsController.dispose();
    return super.close();
  }
}
