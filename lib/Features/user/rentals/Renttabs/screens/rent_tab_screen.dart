import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/screens/add_property_screen.dart';
import 'package:mabeet/Features/user/rentals/available/screens/available_screen.dart';
import 'package:mabeet/Features/user/rentals/rented/screens/rented_screen.dart';
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
        appBar: const CustomAppBar(titleText: "Rentals"),
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "Rented"),
                Tab(text: "Available"),
                Tab(text: "Requests"),
              ],
              indicatorColor: AppColors.primary800,
              labelColor: AppColors.primary800,
              unselectedLabelColor: AppColors.gray400,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RentedScreen(),
                  AvailableScreen(),
                  Center(child: Text("Requests Screen")),
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
