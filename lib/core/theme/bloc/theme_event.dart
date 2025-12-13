import 'package:flutter/material.dart';

@immutable
abstract class ThemeEvent {}

class LoadTheme extends ThemeEvent {}

class ToggleTheme extends ThemeEvent {
  final ThemeMode? themeMode;

  ToggleTheme({this.themeMode});
}
