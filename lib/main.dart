import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/property/cubit/payment_cubit.dart';
import 'package:mabeet/data/repos/user_repo.dart';
import 'Features/splash/splash_screen_handler.dart';
import 'core/theme/bloc/theme_cubit.dart';
import 'core/theme/bloc/theme_state.dart';
import 'Features/auth/screens/on_boarding_screen.dart';
import 'package:flutter/services.dart';
import 'core/api/dio_consumer.dart';
import 'core/cache/cache_helper.dart';
import 'core/theme/app_theme.dart';
import 'Features/auth/services/cubit/user_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  //Fix View To Vertical
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_,) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(
            create: (context) =>
                UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
          ),
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..loadTheme()),
          BlocProvider<PaymentCubit>(create: (context) => PaymentCubit()),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: SplashHandler(),
          themeMode: state.themeMode,
        );
      },
    );
  }
}
