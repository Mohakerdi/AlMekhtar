import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(onPressed: () {}, child: Text("add")),
    );
  }
}
