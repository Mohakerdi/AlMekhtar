// file: edit_profile_screen.dart

import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/profile/screens/Editprofile/widgets/edit_profiledetails.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: AppColors.primary500,
      ),

      body: const EditProfileShowDetails(),
    );
  }
}
