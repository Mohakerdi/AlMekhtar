import 'package:flutter/material.dart';

class AboutUsShowDetails extends StatelessWidget {
  const AboutUsShowDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // This Center widget and its children were moved here
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Profile Settings App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Version 1.0.0 (Build 20241129)',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
