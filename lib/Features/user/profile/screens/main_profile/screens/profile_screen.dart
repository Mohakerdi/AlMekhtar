import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/widgets/CustomAppBar.dart';
import 'package:mabeet/Features/user/profile/screens/About%20us/screens/about_us_screen.dart';
import 'package:mabeet/Features/user/profile/screens/Editprofile/screens/edit_profile_screen.dart';
import 'package:mabeet/Features/user/profile/screens/history/screens/history_screen.dart';
import 'package:mabeet/Features/user/profile/screens/main_profile/widgets/profile_body_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkTheme = false;
  bool _isEnglish = true;

  void _navigateTo(String title) {
    Widget screen;
    switch (title) {
      case 'History':
        screen = const HistoryScreen();
        break;
      case 'Edit Profile':
        screen = const EditProfileScreen();
        break;
      case 'About us':
        screen = const AboutUsScreen();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void _signOut() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User signed out successfully! (Demo)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Profile Screen'),
      body: ProfileBodyWidget(
        isDarkTheme: _isDarkTheme,
        isEnglish: _isEnglish,
        onThemeChanged: (val) => setState(() => _isDarkTheme = val),
        onLanguageChanged: (val) => setState(() => _isEnglish = val),
        onNavigate: _navigateTo,
        onSignOut: _signOut,
      ),
    );
  }
}
