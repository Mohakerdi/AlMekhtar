import 'package:cached_network_image/cached_network_image.dart';
import 'package:mabeet/Features/user/property/screens/property_screen.dart';
import 'package:mabeet/Features/user/property/widgets/favorite_icon-button.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class PopularProperty extends StatelessWidget {
  const PopularProperty({super.key, required this.property});

  final Property property;

  void _goToPropertyScreen(BuildContext context) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: PropertyScreen(property: property, isOwner: false,),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.scale,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String locationName = '${property.state.name}, ${property.area}';
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
                  const Icon(AppIcons.homeIcon, size: 50, color: Colors.white),
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
                          icon: FavoriteIconButton(property: property),
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
                                AppIcons.star,
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
