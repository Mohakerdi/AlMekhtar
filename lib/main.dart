import 'package:flutter/material.dart';
import 'package:mabeet/Features/auth/screens/create_account_screen.dart';
import 'package:mabeet/Features/splash/splash_screen_handler.dart';
import 'package:mabeet/Features/user/home/screens/tabs.dart';
import 'package:mabeet/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: SplashHandler(),
      themeMode: ThemeMode.system,
    );
  }
}