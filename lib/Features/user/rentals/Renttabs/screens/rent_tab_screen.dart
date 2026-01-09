import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/screens/add_property_screen.dart';
import 'package:mabeet/Features/user/rentals/available/screens/available_screen.dart';
import 'package:mabeet/Features/user/rentals/myProperties/screens/my_properties_screen.dart';
import 'package:mabeet/Features/user/rentals/requests/screens/requests_screen.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/widgets/CustomAppBar.dart';

class RentTabScreen extends StatelessWidget {
  const RentTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(titleText: AppStrings.ownerTitle.tr()),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: AppStrings.contracts.tr()),
                Tab(text: AppStrings.myProperties.tr()),
                Tab(text: AppStrings.requests.tr()),
              ],
              indicatorColor: AppColors.primary800,
              labelColor: AppColors.primary800,
              unselectedLabelColor: AppColors.gray400,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AvailableScreen(),
                  MyPropertiesScreen(),
                  RequestsScreen()
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddPropertyScreen()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
