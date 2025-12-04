import 'package:flutter/material.dart';
import 'package:mabeet/Features/auth/screens/on_boarding_screen.dart';
import 'package:mabeet/Features/splash/splash_screen_handler.dart';
import 'package:flutter/services.dart';
import 'package:mabeet/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      home: SplashHandler(),
      themeMode: ThemeMode.light,
    );
  }
}
