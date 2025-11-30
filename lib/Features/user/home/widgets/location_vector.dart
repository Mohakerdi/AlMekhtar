import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/text_styles.dart';

import '../../../../core/constants/images.dart';
import '../../../../core/theme/app_colors.dart';

class LocationVector extends StatelessWidget {
  const LocationVector({super.key}); // edit constructor to recieve name & image

  final String name='';
  final String image='';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary100,
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              SizedBox(
                height: 50,width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(AppImages.kDyarImage, fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
                ),
              ),
              Text(' Damascus', style: AppTextStyles.titleMedium.copyWith(color: AppColors.gray400),)
            ],
          ),
        ),
      )
    );
  }
}
