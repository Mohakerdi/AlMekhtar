import 'package:mabeet/core/cache/cache_helper.dart';
import 'package:flutter/material.dart';

class ThemeRepo {
  static const _key = 'theme_mode';

  Future<void> saveTheme(ThemeMode mode) async {
    CacheHelper().saveData(key: _key, value: mode.name);
  }

  Future<ThemeMode> loadTheme() async {
    final themeName = CacheHelper().getData(key: _key);

    if (themeName == null) return ThemeMode.system;

    return ThemeMode.values.firstWhere(
          (e) => e.name == themeName,
      orElse: () => ThemeMode.system,
    );
  }
}