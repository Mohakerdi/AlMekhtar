import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/models/state.dart';

class LocationWidget extends StatelessWidget {
  final Location govenorant;
  final String area;
  final String detailed;

  const LocationWidget({super.key, required this.govenorant, required this.area, required this.detailed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined),
          Expanded(
            child: Text(
              softWrap: true,
              '${govenorant.name}, $area\n$detailed',
              style: TextStyle(color: AppColors.gray400, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
