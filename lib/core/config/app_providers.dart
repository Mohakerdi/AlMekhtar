import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/auth/screens/create_account_screen.dart';
import 'package:mabeet/Features/auth/screens/on_boarding_screen.dart';
import 'package:mabeet/Features/auth/services/cubit/user_cubit.dart';
import 'package:mabeet/Features/splash/splash_screen_handler.dart';
import 'package:mabeet/Features/user/bookings/payment/cubit/payment_cubit.dart';
import 'package:mabeet/Features/user/favorites/services/cubit/favorite_cubit.dart';
import 'package:mabeet/Features/user/favorites/services/data/favorite_rep.dart';
import 'package:mabeet/Features/user/favorites/services/data/favorite_webservices.dart';
import 'package:mabeet/Features/user/home/search/cubit/search_filter_cubit.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/core/cache/cache_helper.dart';
import 'package:mabeet/core/notifications_service/local_notification_service.dart';
import 'package:mabeet/core/theme/bloc/theme_cubit.dart';
import 'package:mabeet/data/repos/payment_repo.dart';
import 'package:mabeet/data/repos/search_repo.dart';
import 'package:mabeet/data/repos/user_repo.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) =>
              UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..loadTheme(),
        ),
        BlocProvider<PaymentCubit>(
          create: (context) => PaymentCubit(
            paymentRepository: PaymentRepository(api: DioConsumer(dio: Dio())),
          ),
        ),
        BlocProvider<SearchFilterCubit>(
          create: (context) => SearchFilterCubit(
            searchRepo: SearchRepository(api: DioConsumer(dio: Dio())),
          ),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(
            FavoriteRepository(
              FavoriteWebServices(api: DioConsumer(dio: Dio())),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}

Future<void> initializeApp() async {
  // 1. Core Bindings
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();
  await EasyLocalization.ensureInitialized();

  // 2. Caching
  await CacheHelper.init();

  // 3. System Overrides
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class StartupWrapper extends StatelessWidget {
  final bool isLoggedIn;
  final bool onBoardingSeen;

  const StartupWrapper({
    super.key,
    required this.isLoggedIn,
    required this.onBoardingSeen,
  });

  @override
  Widget build(BuildContext context) {
    if (!onBoardingSeen) {
      return const OnboardingScreen();
    } else if (isLoggedIn) {
      return const SplashHandler();
    } else {
      return const CreateAccountScreen();
    }
  }
}
