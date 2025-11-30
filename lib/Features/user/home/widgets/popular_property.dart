import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';

import '../../../../core/theme/text_styles.dart';
import '../screens/property_screen.dart';

class PopularProperty extends StatelessWidget {
  const PopularProperty({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => PropertyScreen(property: property),
            ),
          );
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
                            ? property.title.substring(0, 13) + '...'
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
                            property.location.name.length > 15
                                ? '${property.location.name.substring(0, 15)}...'
                                : property.location.name,
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
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              Icon(Icons.star,size: 18, color: AppColors.warning700,),
                              Text('${property.avgRate}',style: AppTextStyles.bodyMediumBold,)
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
