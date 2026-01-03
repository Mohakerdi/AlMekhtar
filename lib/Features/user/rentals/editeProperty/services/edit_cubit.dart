import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/services/add_state.dart';
import 'package:mabeet/Features/user/rentals/editeProperty/services/edit_state.dart';
import 'package:mabeet/data/models/state.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class EditPropertyCubit extends Cubit<EditPropertyState> {
  final Property property;
  EditPropertyCubit(this.property) : super(EditPropertyInitial()) {
    selectedState = Location.Damascus;
    selectedCity = 'Mazzeh';
    floorsController.text = '1';
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationDescriptionController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController floorsController = TextEditingController();

  Location selectedState = Location.Damascus;
  String selectedCity = '';

  File? selectedImage;

  void _fillData() {
    titleController.text = property.title;
    descriptionController.text = property.description;
    locationDescriptionController.text = property.describedLocation;
    costController.text = property.costPerNight.toString();
    areaController.text = property.area.toString();
    floorsController.text = property.floor.toString();

    selectedState = property.state;
    selectedCity = property.city;

    if (property.imageURLs.isNotEmpty) {
      selectedImage = File(property.imageURLs.first);
    }
  }

  selectImage(File image) {
    selectedImage = image;
    emit(EditPropertyImageSelected(image));
  }

  void setStateLocation(Location state) {
    selectedState = state;
    final stateModel = syrianStates.firstWhere((s) => s.name == state.name);
    selectedCity = stateModel.areas.isNotEmpty ? stateModel.areas[0] : '';
    emit(EditPropertyImageSelected(selectedImage ?? File('')));
  }

  void setCity(String city) {
    selectedCity = city;
    emit(EditPropertyImageSelected(selectedImage ?? File('')));
  }

  void editProperty() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        costController.text.isEmpty ||
        areaController.text.isEmpty ||
        floorsController.text.isEmpty ||
        selectedImage == null ||
        selectedCity.isEmpty) {
      emit(EditPropertyError('Please fill all fields'));
      return;
    }

    emit(EditPropertyLoading());

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

    emit(EditPropertySuccess());
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
