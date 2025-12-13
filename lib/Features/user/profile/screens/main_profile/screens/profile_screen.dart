import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/widgets/CustomAppBar.dart';
import '../../About%20us/screens/about_us_screen.dart';
import '../../Editprofile/screens/edit_profile_screen.dart';
import '../../history/screens/history_screen.dart';
import '../widgets/profile_body_widget.dart';
import '../../../../../../core/theme/bloc/theme_state.dart';

import '../../../../../../core/theme/bloc/theme_bloc.dart';
import '../../../../../../core/theme/bloc/theme_event.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == ThemeMode.dark;
        return Scaffold(
          appBar: CustomAppBar(titleText: 'Profile Screen'),
          body: ProfileBodyWidget(
            isDarkTheme: isDark,
            isEnglish: _isEnglish,
            onThemeChanged: (val) => _handleThemeChange(),
            onLanguageChanged: (val) => setState(() => _isEnglish = val),
            onNavigate: _navigateTo,
            onSignOut: _signOut,
          ),
        );
      },
    );
  }

  void _handleThemeChange() async {
    final themeBloc = context.read<ThemeBloc>();
    final screenContext = context;
    showDialog(
      context: screenContext,
      barrierDismissible: false,
      builder: (context) {
        final currentThemeMode = themeBloc.state.themeMode;
        final nextThemeName = (currentThemeMode == ThemeMode.dark)
            ? 'Light'
            : 'Dark';

        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              Text('Changing to $nextThemeName Theme...'),
            ],
          ),
        );
      },
    );
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      Navigator.of(screenContext, rootNavigator: true).pop();
    }
    if (mounted) {
      themeBloc.add(ToggleTheme());
    }
  }

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
}
