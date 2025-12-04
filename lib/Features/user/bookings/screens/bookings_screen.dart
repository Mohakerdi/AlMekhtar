import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text('Bookings Screen'),),
      body: const SingleChildScrollView(
        child: Center(child: Text('This is Profile Page')),
      ),
    );
  }
}
