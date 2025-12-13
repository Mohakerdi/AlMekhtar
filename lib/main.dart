import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/auth/screens/on_boarding_screen.dart';
import 'package:flutter/services.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/core/theme/app_theme.dart';

import 'Features/auth/services/cubit/user_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      BlocProvider(
        create: (context) => UserCubit(DioConsumer(dio: Dio())),
        child: const MyApp(),
      ),
    );
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
      home: OnboardingScreen(),
      themeMode: ThemeMode.light,
    );
  }
}
