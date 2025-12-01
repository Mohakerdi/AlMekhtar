// file: about_us_screen.dart

import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/profile/screens/About%20us/widgets/about_us_details.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About us'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // The body now uses the new, separate widget
      body: const AboutUsShowDetails(),
    );
  }
}
