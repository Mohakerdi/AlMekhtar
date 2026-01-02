import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
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
import 'package:mabeet/Features/user/rentals/editeProperty/services/edit_cubit.dart';
import 'package:mabeet/Features/user/rentals/editeProperty/services/edit_state.dart';
import 'package:mabeet/Features/user/rentals/editeProperty/widgets/edit_button.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/models/state.dart';

class EditPropertyScreen extends StatelessWidget {
  final Property property;

  const EditPropertyScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditPropertyCubit(property),
      child: Scaffold(
        appBar: AppBar(title: Text('Edit Your Property')),
        body: BlocConsumer<EditPropertyCubit, EditPropertyState>(
          listener: (context, state) {
            if (state is EditPropertyError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is EditPropertySuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Property Edited!')));
            }
          },
          builder: (context, state) {
            final cubit = context.read<EditPropertyCubit>();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  PropertyTitle(controller: cubit.titleController),
                  SizedBox(height: 12),
                  Divider(),

                  SelectLocation(
                    onLocationChanged: (stateSelected, city) {
                      cubit.setStateLocation(stateSelected);
                      cubit.setCity(city);
                    },
                  ),
                  Divider(),

                  SelectFromGallery(
                    onSelectImage: (image) {
                      cubit.selectImage(image);
                    },
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
                  ),
                  Divider(),

                  AreaNumber(controller: cubit.areaController),
                  Divider(),

                  EditButton(
                    onPressed: () {
                      cubit.editProperty();
                    },
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
