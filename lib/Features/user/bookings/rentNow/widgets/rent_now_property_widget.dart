import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';
import '../../../../../core/theme/text_styles.dart';

import 'package:flutter/material.dart';

class RentalsProperty extends StatelessWidget {
  const RentalsProperty({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    final String locationName = '${property.state.name}, ${property.area}';
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary800, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 5,
          children: [
            SizedBox(
              width: 120,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  property.imageURLs[0],
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.title.length > 13
                            ? '${property.title.substring(0, 13)}...'
                            : property.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.gray400,
                          ),
                          Text(
                            locationName.length > 15
                                ? '${locationName.substring(0, 13)}...'
                                : locationName,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '  \$${property.costPerNight}/night',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
