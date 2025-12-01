import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/screens/property_screen.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/font_weight_helper.dart';
import 'package:mabeet/core/theme/text_styles.dart';

import '../../../../data/models/property.dart';

class RecommendedHomeProperty extends StatelessWidget {
  const RecommendedHomeProperty({super.key, required this.property}); // edit constructor to recieve property object

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
    final String locationName = '${property.location.name}, ${property.describedLocation}';

    return SizedBox(
      width: 240,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: InkWell(
          onTap: () {_goToPropertyScreen(context);},
          child: Stack(
            children: [
              Image.asset(property.imageURL, fit: BoxFit.fill, width: double.infinity, height: double.infinity,),
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 25,
                  top: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                          shadowColor: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text(
                                  property.costPerNight.toString(),
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.primary700,
                                    fontWeight: FontWeightHelper.bold,
                                  ),
                                ),
                                Text('/night'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property.title.length > 15
                                  ? '${property.title.substring(0,14,)}...'
                                  : property.title,
                              style: AppTextStyles.titleLarge.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeightHelper.medium
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.place_outlined, color: AppColors.gray400,),
                                Text(
                                  locationName.length > 20
                                      ? '${locationName.substring(0,19,)}...'
                                      : locationName,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.gray400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {},
                            color: Colors.red,
                            icon: Icon(Icons.favorite),
                            padding: EdgeInsets.all(0),
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
      ),
    );
  }
}
