import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/core/config/app_providers.dart';
import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/localization/localiztion_service.dart';
import 'core/theme/bloc/theme_cubit.dart';
import 'core/theme/bloc/theme_state.dart';
import 'core/cache/cache_helper.dart';
import 'core/theme/app_theme.dart';

void main() async {
  await initializeApp();

  final String? token = CacheHelper.getData(key: ApiKey.token);
  final bool isLoggedIn = (token != null && token.isNotEmpty);
  final bool onBoardingSeen =
      CacheHelper.getData(key: ApiKey.onBoardingSeen) ?? false;

  runApp(
    EasyLocalization(
      path: 'assets/localization',
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      startLocale: LocalizationService.getSavedLocale(),
      child: AppProviders(
        child: MyApp(isLoggedIn: isLoggedIn, onBoardingSeen: onBoardingSeen),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.onBoardingSeen,
  });
  final bool isLoggedIn, onBoardingSeen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: state.themeMode,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: StartupWrapper(
            isLoggedIn: isLoggedIn,
            onBoardingSeen: onBoardingSeen,
          ),
        );
      },
    );
  }
}
