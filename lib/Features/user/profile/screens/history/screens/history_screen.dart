import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/profile/screens/history/widgets/history_showdetails.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: AppColors.primary950,
      ),

      body: const HistoryShowDetails(),
    );
  }
}
