import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../cache/cache_helper.dart';

const String _LANG_KEY = 'current_language_code';

class LocalizationService {

  static Future<void> switchLanguage(BuildContext context) async {
    final currentLocale = context.locale;

    final newLocale = currentLocale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');

    await context.setLocale(newLocale);
    await CacheHelper.saveData(key: _LANG_KEY, value: newLocale.languageCode);
  }

  static Locale? getSavedLocale() {
    final savedCode = CacheHelper.getData(key: _LANG_KEY);
    if (savedCode != null && savedCode is String) {
      return Locale(savedCode);
    }
    return null;
  }

  static String getCurrentLanguageCode(BuildContext context) {
    return context.locale.languageCode;
  }
}