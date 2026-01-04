import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/auth/screens/create_account_screen.dart';
import 'package:mabeet/Features/user/bookings/payment/cubit/payment_cubit.dart';
import 'package:mabeet/Features/user/favorites/services/cubit/favorite_cubit.dart';
import 'package:mabeet/Features/user/favorites/services/data/favorite_rep.dart';
import 'package:mabeet/Features/user/favorites/services/data/favorite_webservices.dart';
import 'package:mabeet/Features/user/home/screens/home.dart';
import 'package:mabeet/Features/user/home/search/cubit/search_filter_cubit.dart';
import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/Features/user/notifications/services/cubit/notifications_cubit.dart';
import 'package:mabeet/Features/user/notifications/services/data/notification_repo.dart';
import 'package:mabeet/Features/user/notifications/services/data/notification_webservices.dart';
import 'package:mabeet/core/localization/localiztion_service.dart';
import 'package:mabeet/data/repos/payment_repo.dart';
import 'package:mabeet/data/repos/search_repo.dart';
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

void main() async {
  Dio dio = Dio();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  final String? token = CacheHelper.getData(key: ApiKey.token);
  final bool isLoggedIn = (token != null && token.isNotEmpty);

  final bool onBoardingSeen =
      CacheHelper.getData(key: ApiKey.onBoardingSeen) ?? false;

  //Fix View To Vertical
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      EasyLocalization(
        path: 'assets/localization',
        supportedLocales: const [Locale('en'), Locale('ar')],
        fallbackLocale: const Locale('en'),
        startLocale: LocalizationService.getSavedLocale(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UserCubit>(
              create: (context) =>
                  UserCubit(UserRepository(api: DioConsumer(dio: dio))),
            ),
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit()..loadTheme(),
            ),
            BlocProvider<PaymentCubit>(
              create: (context) => PaymentCubit(
                paymentRepository: PaymentRepository(
                  api: DioConsumer(dio: dio),
                ),
              ),
            ),
            BlocProvider<SearchFilterCubit>(
              create: (context) => SearchFilterCubit(
                searchRepo: SearchRepository(api: DioConsumer(dio: dio)),
              ),
            ),
            BlocProvider<FavoriteCubit>(
              create: (context) => FavoriteCubit(
                FavoriteRepository(
                  FavoriteWebServices(api: DioConsumer(dio: dio)),
                ),
              ),
            ),
            BlocProvider<NotificationCubit>(
              create: (context) {
                return NotificationCubit(
                  NotificationRepo(
                    NotificationWebServices(api: DioConsumer(dio: dio)),
                  ),
                );
              },
            ),
          ],
          child: MyApp(isLoggedIn: isLoggedIn, onBoardingSeen: onBoardingSeen),
        ),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.onBoardingSeen,
  });

  final bool isLoggedIn;
  final bool onBoardingSeen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        Widget startWidget;
        if (!onBoardingSeen) {
          startWidget = const OnboardingScreen();
        } else if (isLoggedIn) {
          startWidget = const SplashHandler();
        } else {
          startWidget = const CreateAccountScreen();
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: state.themeMode,

          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,

          home: startWidget,
        );
      },
    );
  }
}
