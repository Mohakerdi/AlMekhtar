import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/widgets/search_field.dart';
import 'package:mabeet/Features/user/home/widgets/swiper.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static void _showOverlay() {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SearchField(onBtnPressed: _showOverlay,),
              SizedBox(height: 25),
              Swiper(),
            ],
          ),
        ),
      ),
    );
  }
}
