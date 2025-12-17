import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/repos/theme_repo.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial());

  final _repo = ThemeRepo();

  Future<void> loadTheme() async {
    final savedTheme = await _repo.loadTheme();
    emit(ThemeState(savedTheme));
  }

  Future<void> toggleTheme() async {
    ThemeMode newMode = (state.themeMode == ThemeMode.dark)
        ? ThemeMode.light
        : ThemeMode.dark;

    await _repo.saveTheme(newMode);
    emit(state.copyWith(themeMode: newMode));
  }
}
