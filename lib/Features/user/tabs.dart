import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/bookings/screens/bookings_screen.dart';
import 'package:mabeet/Features/user/favorites/screens/favorites_screen.dart';
import 'package:mabeet/Features/user/profile/screens/main_profile/screens/profile_screen.dart';
import 'package:mabeet/Features/user/rentals/screens/rentals_screen.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'home/screens/home.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      BookingsScreen(),
      RentalsScreen(),
      FavoritesScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.homeIcon),
        inactiveIcon: Icon(AppIcons.inactiveHomeIcon),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: AppColors.gray400,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.bookIcon),
        inactiveIcon: Icon(AppIcons.inactiveBookIcon),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: AppColors.gray400,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.rentIcon),
        inactiveIcon: Icon(AppIcons.inactiveRentIcon),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: AppColors.gray400,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.favIcon),
        inactiveIcon: Icon(AppIcons.inactiveFavIcon),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: AppColors.gray400,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.profileIcon),
        inactiveIcon: Icon(AppIcons.inactiveProfileIcon),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: AppColors.gray400,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 55,
      navBarStyle: NavBarStyle.style3,
    );
  }
}
