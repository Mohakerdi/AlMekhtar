import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mabeet/Features/user/property/screens/property_screen.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class FavoritesProperty extends StatelessWidget {
  const FavoritesProperty({super.key, required this.property});

  final Property property;

  void _goToPropertyScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => PropertyScreen(property: property, isOwner: false,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String locationName = '${property.state.name}, ${property.city}';
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
                child: CachedNetworkImage(
                  imageUrl: property.imageURLs[0],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(color: Colors.white),
                  errorWidget: (context, url, error) =>
                  Icon(AppIcons.homeIcon, size: 50, color: Colors.white),
                )
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
                            AppIcons.location,
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
                        '  \$${property.costPerNight}/${AppStrings.night.tr()}',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                  Column(
                    spacing: 5,
                    children: [
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
                                AppIcons.star,
                                size: 18,
                                color: AppColors.warning700,
                              ),
                              Text(
                                '${property.avgRate.toStringAsFixed(1)}',
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
