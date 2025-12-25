import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/data/models/state.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key, required this.onLocationChanged});

  final void Function(Location state, String area) onLocationChanged;

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  Location _selectedGovernorat = Location.Damascus;

  String _selectedArea = "Mazzeh";

  List<String> availableAreas = syrianStates[0].areas;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Select Location", style: AppTextStyles.heading2Medium),
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
                  for (StateModel state in syrianStates) {
                    if (state.name == _selectedGovernorat.name) {
                      availableAreas = state.areas;
                      _selectedArea = availableAreas.isNotEmpty
                          ? availableAreas[0]
                          : '';
                      break;
                    }
                  }
                });

                widget.onLocationChanged(_selectedGovernorat, _selectedArea);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: Card(
            child: DropdownButton<String>(
              value:
                  _selectedArea.isNotEmpty &&
                      availableAreas.contains(_selectedArea)
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
                return DropdownMenuItem(value: area, child: Text('  $area'));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedArea = value!;
                });

                widget.onLocationChanged(_selectedGovernorat, _selectedArea);
              },
            ),
          ),
        ),
      ],
    );
  }
}
