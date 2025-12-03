import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text('Favorites Screen'),),
      body: const SingleChildScrollView(
        child: Center(child: Text('This is Favorites Page')),
      ),
    );
  }
}
