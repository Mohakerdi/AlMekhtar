import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/services/add_state.dart';
import 'package:mabeet/data/models/state.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {
  AddPropertyCubit() : super(AddPropertyInitial()) {
    // تهيئة افتراضية عشان لا يبقى selectedCity أو floors فارغة
    // اختَرش القيمة اللي بتطابق ويدجت SelectLocation الافتراضية
    selectedState = Location.Damascus;
    selectedCity = 'Mazzeh'; // نفس القيمة الافتراضية بالويدجت
    floorsController.text = '1'; // SpinBox يعرض 1 بصرياً → خزّنه فعلياً
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

  selectImage(File image) {
    selectedImage = image;
    emit(AddPropertyImageSelected(image));
  }

  void setStateLocation(Location state) {
    selectedState = state;
    // عند تغيير المحافظة عادة نحدّث المنطقة الافتراضية:
    final stateModel = syrianStates.firstWhere((s) => s.name == state.name);
    selectedCity = stateModel.areas.isNotEmpty ? stateModel.areas[0] : '';
    // إذا بدك تبعث state للـ UI:
    emit(AddPropertyImageSelected(selectedImage ?? File('')));
  }

  void setCity(String city) {
    selectedCity = city;
    // emit لو بدك تعيد بناء الواجهة
    emit(AddPropertyImageSelected(selectedImage ?? File('')));
  }

  void addProperty() {
    // — debug مساعد (شيّك القيم قبل الفحص)
    //print أو استخدام logger عشان تشوف الvalues
    print(
      'title=${titleController.text}, desc=${descriptionController.text}, cost=${costController.text}, area=${areaController.text}, floors=${floorsController.text}, img=${selectedImage?.path}, city=$selectedCity',
    );

    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        costController.text.isEmpty ||
        areaController.text.isEmpty ||
        floorsController.text.isEmpty ||
        selectedImage == null ||
        selectedCity.isEmpty) {
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
