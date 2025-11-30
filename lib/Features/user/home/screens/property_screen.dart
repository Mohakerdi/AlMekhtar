import 'package:flutter/material.dart';
import '../../../../data/models/property.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(child: Text('This is Property Screen Nigga')),
      ),
    );
  }
}
