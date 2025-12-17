import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/data/models/state.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../search/screens/search_screen.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.city});

  final Location city;

  void _goToSearchScreen(BuildContext context) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: SearchScreen(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 1.5,
      child: InkWell(
        onTap: () {
          _goToSearchScreen(context);
        },
        child: Stack(
          children: [
            Image.asset(
              city.imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 36,
                ),
                child: Column(
                  children: [
                    Text(
                      city.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.heading1Regular.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
