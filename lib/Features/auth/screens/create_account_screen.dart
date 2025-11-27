import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  bool passwordVisible = false;

  String _email = '';
  String _name = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Welcome Back', style: AppTextStyles.heading1Bold,)
                ],
              ),
            )
        ),
      ),
    );
  }

}