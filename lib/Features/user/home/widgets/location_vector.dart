import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/constants/images.dart';
import '../../../../core/theme/app_colors.dart';
import '../screens/search_screen.dart';

class LocationVector extends StatelessWidget {
  const LocationVector({
    super.key,
    required this.name,
    required this.image,
  }); // edit constructor to recieve name & image

  final String name;
  final String image;

  void _goToSearchScreen(BuildContext context) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: SearchScreen(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.gray300, width: 1.5),
      ),
      color: AppColors.primary100,
      shadowColor: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          _goToSearchScreen(context);
        },
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(
                    this.image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Text(
                '  ' + this.name,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.gray400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
