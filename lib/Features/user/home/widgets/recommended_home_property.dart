import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/font_weight_helper.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class RecommendedHomeProperty extends StatelessWidget {
  const RecommendedHomeProperty({super.key}); // edit constructor to recieve property object

  //final Property property;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Image.asset(AppImages.kDyarImage, fit: BoxFit.fill, width: double.infinity, height: double.infinity,),
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
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text(
                                  '\$30',
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
                              'Bit Byte',
                              style: AppTextStyles.titleLarge.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeightHelper.medium
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.place_outlined, color: AppColors.gray400,),
                                Text(
                                  'Damascus, Abo remmaneh'.length > 20
                                      ? 'Damascus, Abo remmaneh'.substring(0,19,) +'...'
                                      : 'Damascus, Abo remmaneh',
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
