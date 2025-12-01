import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/profile/screens/About%20us/screens/about_us_screen.dart';
import 'package:mabeet/Features/user/profile/screens/Editprofile/screens/edit_profile_screen.dart';
import 'package:mabeet/Features/user/profile/screens/history/screens/history_screen.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/Features/user/profile/screens/main_profile/widgets/profile_section_header.dart';
import 'package:mabeet/Features/user/profile/screens/main_profile/widgets//profile_navigation_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State for the sliding toggles
  bool _isDarkTheme = false;
  bool _isEnglish =
      true; // Simulating language switch (e.g., English vs Spanish)

  // Helper function for navigation
  void _navigateTo(String title) {
    Widget screen; // This will hold the screen widget we want to navigate to.

    // Use a switch statement to choose the correct screen.
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
        // If the title is unknown, we do nothing.
        return;
    }

    // Use Navigator.push to show the selected screen.
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  // Helper function for the Sign Out button
  void _signOut() {
    // In a real app, you would implement your Firebase/other auth sign-out logic here.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User signed out successfully! (Demo)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: const [
                CircleAvatar(
                  radius: 70,

                  backgroundImage: AssetImage('assets/images/appprofile.jpg'),
                ),
                SizedBox(height: 4),
                Text(
                  'Hans Landa',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  'loisbloom2005@gmail.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),

            const Divider(),

            // 2. Theme Toggle (تبقى هنا لأنها تستخدم setState)
            SwitchListTile(
              secondary: Icon(
                _isDarkTheme ? Icons.brightness_4 : Icons.brightness_7,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Theme'),
              subtitle: Text(_isDarkTheme ? 'Dark Mode' : 'Light Mode'),
              value: _isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  _isDarkTheme = value;
                });
              },
            ),

            // 3. Languages Toggle (تبقى هنا لأنها تستخدم setState)
            SwitchListTile(
              secondary: Icon(
                Icons.language,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Languages'),
              subtitle: Text(_isEnglish ? 'English' : 'Arabic'),
              value: _isEnglish,
              onChanged: (bool value) {
                setState(() {
                  _isEnglish = value;
                });
              },
            ),

            const Divider(),

            // 4. History (استخدام المكون الجديد)
            ProfileNavigationTile(
              title: 'History',
              icon: Icons.history,
              onTap: () => _navigateTo('History'),
            ),

            // 5. Edit Profile (استخدام المكون الجديد)
            ProfileNavigationTile(
              title: 'Edit Profile',
              icon: Icons.edit,
              onTap: () => _navigateTo('Edit Profile'),
            ),

            // 6. About us (استخدام المكون الجديد)
            ProfileNavigationTile(
              title: 'About us',
              icon: Icons.info_outline,
              onTap: () => _navigateTo('About us'),
            ),

            const SizedBox(height: 175),

            // 7. Sign Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton.icon(
                onPressed: _signOut,
                icon: const Icon(Icons.logout),
                label: const Text('Sign Out', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  // Custom color for visibility
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
