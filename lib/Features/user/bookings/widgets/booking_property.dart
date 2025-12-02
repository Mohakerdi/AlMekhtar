import 'package:mabeet/Features/user/property/screens/property_screen.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';
import '../../../../core/theme/text_styles.dart';

import 'package:flutter/material.dart';

class BookingProperty extends StatelessWidget {
  const BookingProperty({super.key, required this.property});

  final Property property;

  void _goToPropertyScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => PropertyScreen(property: property),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final String locationName = '${property.location.name}, ${property.describedLocation}';
    final String locationName = property.describedLocation;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          _goToPropertyScreen(context);
        },
        child: Row(
          spacing: 5,
          children: [
            SizedBox(
              width: 120,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  property.imageURL,
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
                  Column(
                    spacing: 5,
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.red,
                          icon: Icon(Icons.favorite_border),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        color: AppColors.warning50,
                        shadowColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: AppColors.warning700,
                              ),
                              Text(
                                '${property.avgRate}',
                                style: AppTextStyles.bodyMediumBold,
                              ),
                            ],
                          ),
                        ),
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
