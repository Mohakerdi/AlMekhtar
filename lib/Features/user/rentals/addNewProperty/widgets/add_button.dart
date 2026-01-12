import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEdit;
  const AddButton({super.key, required this.onPressed, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(isEdit?'Edit':'Add Property'),
      ),
    );
  }
}
