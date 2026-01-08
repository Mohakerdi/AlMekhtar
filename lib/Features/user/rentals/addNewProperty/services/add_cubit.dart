import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/services/add_state.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/owner_repo.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {
  AddPropertyCubit({required this.ownerRepository,Property? initialProperty,})
      : super(AddPropertyInitial()) {_initialize(initialProperty);}

  final OwnerRepository ownerRepository;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationDescriptionController = TextEditingController();
  final costController = TextEditingController();
  final floorsController = TextEditingController();
  final areaController = TextEditingController();
  final cardNumberController = TextEditingController();

  final List<XFile> selectedImages = [];
  final List<String> existingImageUrls = [];

  String? selectedState;
  String? selectedCity;

  bool _initialized = false;
  Property? _editingProperty;

  void _initialize(Property? property) {
    if (_initialized) return;

    if (property != null) {
      _editingProperty = property;

      titleController.text = property.title;
      descriptionController.text = property.description;
      locationDescriptionController.text = property.describedLocation;
      costController.text = property.costPerNight.toString();
      floorsController.text = property.floor.toString();
      areaController.text = property.area.toString();

      selectedState = property.state.name;
      selectedCity = property.city;
      existingImageUrls.addAll(property.imageURLs);
    }

    _initialized = true;
  }

  void selectImages(List<XFile> images) {
    selectedImages
      ..clear()
      ..addAll(images);
    emit(AddPropertyImagesUpdated());
  }

  void setLocation({
    required String state,
    required String city,
  }) {
    selectedState = state;
    selectedCity = city;
    emit(AddPropertyLocationUpdated(state: state, city: city));
  }


  Future<String> addOrEditProperty(bool isEditMode) async {

    emit(AddPropertyLoading());
    final response = isEditMode
        ? await ownerRepository.editProperty(
      propertyId: _editingProperty!.propertyId,
      title: titleController.text,
      description: descriptionController.text,
      addressDescription: locationDescriptionController.text,
      price: costController.text
    )
        : await ownerRepository.addProperty(
      title: titleController.text,
      description: descriptionController.text,
      addressDescription: locationDescriptionController.text,
      price: costController.text,
      floor: floorsController.text,
      area: areaController.text,
      state: selectedState!,
      city: selectedCity!,
      images: selectedImages,
      cardNumber: cardNumberController.text
    );

    return response;
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    locationDescriptionController.dispose();
    costController.dispose();
    floorsController.dispose();
    areaController.dispose();
    cardNumberController.dispose();
    return super.close();
  }
}
