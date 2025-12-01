import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/profile/screens/history/widgets/history_showdetails.dart';

// ---------------------------------------------------
// 1. The main screen widget (Scaffold and AppBar)
// ---------------------------------------------------
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // The body now uses the new, separate widget
      body: const HistoryShowDetails(),
    );
  }
}
