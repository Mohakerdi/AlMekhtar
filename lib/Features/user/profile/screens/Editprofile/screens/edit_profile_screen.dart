// file: edit_profile_screen.dart

import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/profile/screens/Editprofile/widgets/edit_profiledetails.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // The body now uses the new, separate widget
      body: const EditProfileShowDetails(),
    );
  }
}
