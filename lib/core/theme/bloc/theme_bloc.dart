import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/repos/theme_repo.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);
    add(LoadTheme());
  }

  final _repo = ThemeRepo();

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final savedTheme = await _repo.loadTheme();
    emit(ThemeState(savedTheme));
  }

  Future<void> _onToggleTheme(
    ToggleTheme event,
    Emitter<ThemeState> emit,
  ) async {
    ThemeMode newMode = (state.themeMode == ThemeMode.dark)
        ? ThemeMode.light
        : ThemeMode.dark;

    await _repo.saveTheme(newMode);
    emit(state.copyWith(themeMode: newMode));
    print('Theme toggled to: $newMode');
  }
}
