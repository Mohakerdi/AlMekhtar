import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/bookings/screens/bookings_screen.dart';
import 'package:mabeet/Features/user/chat/screens/chat_screen.dart';
import 'package:mabeet/Features/user/favorites/screens/favorites_screen.dart';
import 'package:mabeet/Features/user/profile/screens/profile_screen.dart';
import 'package:mabeet/Features/user/rentals/screens/rentals_screen.dart';

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
        activePage = HomeScreen();      break;
      case 1:
        activePage = BookingsScreen();  break;
      case 2:
        activePage = RentalsScreen();   break;
      case 3:
        activePage = FavoritesScreen(); break;
      case 4:
        activePage = ProfileScreen();   break;
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
                MaterialPageRoute(
                  builder: (builder) => const Chatscreen(),
                ),
              );
            },
            icon: const Icon(Icons.chat),
          ),
        ],
      ),

      body: activePage,

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 0
                ? Icon(Icons.home)
                : Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 1
                ? Icon(Icons.key)
                : Icon(Icons.key_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 2
                ? Icon(Icons.add_box)
                : Icon(Icons.add_box_outlined),
            label: 'Rentals',
          ),
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 3
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 4
                ? Icon(Icons.person)
                : Icon(Icons.perm_identity),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
