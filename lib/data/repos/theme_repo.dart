import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeRepo {
  static const _key = 'theme_mode';

  Future<void> saveTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, mode.name);
  }

  Future<ThemeMode> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString(_key);

    if (themeName == null) return ThemeMode.system;

    return ThemeMode.values.firstWhere(
          (e) => e.name == themeName,
      orElse: () => ThemeMode.system,
    );
  }
}