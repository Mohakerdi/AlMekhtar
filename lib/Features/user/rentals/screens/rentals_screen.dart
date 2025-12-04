import 'package:flutter/material.dart';

class RentalsScreen extends StatelessWidget {
  const RentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Rentals Screen'),),
      body: const SingleChildScrollView(
        child: Center(child: Text('This is Rentals Page')),
      ),
    );
  }
}
