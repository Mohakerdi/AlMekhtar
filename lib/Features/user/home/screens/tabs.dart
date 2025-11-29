import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mabeet/Features/user/bookings/screens/bookings_screen.dart';
import 'package:mabeet/Features/user/chat/screens/chat_screen.dart';
import 'package:mabeet/Features/user/favorites/screens/favorites_screen.dart';
import 'package:mabeet/Features/user/profile/screens/profile_screen.dart';
import 'package:mabeet/Features/user/rentals/screens/rentals_screen.dart';
import 'package:mabeet/core/constants/icons.dart';

import '../../notifications/screens/notifications_screen.dart';
import 'home.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen();
    switch (_selectedPageIndex) {
      case 0:
        activePage = HomeScreen();
        break;
      case 1:
        activePage = BookingsScreen();
        break;
      case 2:
        activePage = RentalsScreen();
        break;
      case 3:
        activePage = FavoritesScreen();
        break;
      case 4:
        activePage = ProfileScreen();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => const NotificationsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (builder) => const Chatscreen()),
              );
            },
            icon: const Icon(Icons.chat),
          ),
        ],
      ),

      body: activePage,

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.key), label: 'Bookings'),
          BottomNavigationBarItem(
            activeIcon: Icon(AppIcons.rentIcon),
            icon: Icon(AppIcons.rentIcon),
            label: 'Rentals',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
