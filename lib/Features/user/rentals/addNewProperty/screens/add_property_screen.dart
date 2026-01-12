import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/services/add_cubit.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/services/add_state.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/select%20_location.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/select_from_gallery.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/property_title.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/property_description.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/location_description.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/property_cost.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/floors_number.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/area_number.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/widgets/add_button.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/repos/owner_repo.dart';

class AddPropertyScreen extends StatelessWidget {
  final Property? propertyToEdit;
  final bool isEditMode;

  const AddPropertyScreen({super.key, this.propertyToEdit,})
    : isEditMode = propertyToEdit != null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddPropertyCubit(
        ownerRepository: OwnerRepository(api: DioConsumer(dio: Dio())),
        initialProperty: propertyToEdit,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('Add Your Property')),
        body: BlocConsumer<AddPropertyCubit, AddPropertyState>(
          listener: (context, state) {
            if (state is AddPropertyError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is AddPropertySuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Property added!')));
            }
          },
          builder: (context, state) {
            final cubit = context.watch<AddPropertyCubit>();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  PropertyTitle(controller: cubit.titleController),
                  SizedBox(height: 12),
                  Divider(),
                  TextFormField(
                    controller: cubit.cardNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Bank Card Number',
                      hintText: 'Enter your bank card number',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                  ),
                  Divider(),
                  SelectLocation(
                    onLocationChanged: (stateSelected, city) {
                      cubit.setLocation(state: stateSelected.name, city: city);
                    },
                  ),
                  Divider(),
                  SelectFromGallery(
                    isEditMode: isEditMode,
                    selectedImages: cubit.selectedImages,
                    existingImageUrls: cubit.existingImageUrls,
                    onImagesChanged: cubit.selectImages,
                  ),
                  Divider(),

                  LocationDescription(
                    controller: cubit.locationDescriptionController,
                  ),
                  Divider(),

                  PropertyDescription(controller: cubit.descriptionController),
                  Divider(),

                  PropertyCost(controller: cubit.costController),
                  Divider(),

                  FloorsNumber(
                    onChanged: (value) {
                      cubit.floorsController.text = value.toInt().toString();
                    },
                    controller: cubit.floorsController,
                  ),
                  Divider(),

                  AreaNumber(controller: cubit.areaController),
                  Divider(),

                  AddButton(
                    onPressed: () {
                      cubit.addOrEditProperty(isEditMode);
                    },
                    isEdit: isEditMode,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
