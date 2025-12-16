import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/rentals/widgets/select_from_gallery.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/state.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  Location _selectedGovernorat = Location.Damascus;
  String _selectedArea = "Mazzeh";
  List<String> availableAreas = syrianStates[0].areas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Your Property!')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Enter your property title",
                labelStyle: TextStyle(color: AppColors.gray400),
                suffixIcon: Icon(AppIcons.homeIcon),
              ),
            ),
            SizedBox(height: 12,),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Location",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray950,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Card(
                child: DropdownButton<Location>(
                  value: _selectedGovernorat,
                  hint: const Text("  Select Location"),
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  borderRadius: BorderRadius.circular(12),
                  items: Location.values.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text("  ${location.name}"),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGovernorat = value!;
                      for(StateModel state in syrianStates){
                        if(state.name == _selectedGovernorat.name){
                          availableAreas = state.areas;
                          _selectedArea = availableAreas.isNotEmpty ? availableAreas[0] : '';
                          break;
                        }
                      }
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Card(
                child: DropdownButton<String>(
                  value: _selectedArea.isNotEmpty && availableAreas.contains(_selectedArea)
                      ? _selectedArea
                      : availableAreas.isNotEmpty
                      ? availableAreas[0]
                      : null,
                  hint: const Text("  Select Area"),
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  borderRadius: BorderRadius.circular(12),
                  items: availableAreas.map((area) {
                    return DropdownMenuItem(
                      value: area,
                      child: Text(area),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedArea = value!;
                    });
                  },
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add Photo Or Video",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray950,
                  ),
                ),
              ),
            ),
            SelectFromGallery(onSelectImage: (image) {}),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 10,
                minLines: 3,
                decoration: InputDecoration(
                  labelText: "Enter your property location description",
                  labelStyle: TextStyle(color: AppColors.gray400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 10,
                minLines: 3,
                decoration: InputDecoration(
                  labelText: "Enter your property description",
                  labelStyle: TextStyle(color: AppColors.gray400),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Enter rent cost \$",
                  labelStyle: TextStyle(color: AppColors.gray400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(onPressed: () {}, child: Text("add")),
            ),
          ],
        ),
      ),

      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("add"),
        backgroundColor: AppColors.primary700,
        extendedPadding: EdgeInsets.symmetric(horizontal: 130),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
    );
  }
}
