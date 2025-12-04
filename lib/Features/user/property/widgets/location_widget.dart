import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';

class LocationWidget extends StatelessWidget {
  final Location location;

  const LocationWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined),
          Text(
            location.toString().split('.').last,
            style: TextStyle(color: AppColors.gray400, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
