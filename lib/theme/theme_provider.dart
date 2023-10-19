import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/res/app_strings.dart';
import 'package:surf_flutter_courses_template/theme/my_theme.dart';

import '../home_page/data/local_source.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    loadTheme();
  }

  final ThemePreferences _themePreferences = ThemePreferences();

  ThemeData _themeData = MyThemes.lightTheme1;

  ThemeData get themeData => _themeData;

  int _selectedColorScheme = 1;

  int get selectedColorScheme => _selectedColorScheme;

  //Выбор темы

  void toggleTheme(int selectedColorScheme, String selectedValueTheme) {
    _themeData = MyThemes.getTheme(
        selectedColorScheme, selectedValueTheme == AppStrings.systemThemDark);
    _selectedColorScheme = selectedColorScheme;
    saveTheme(selectedColorScheme);
    notifyListeners();
  }

  void toggleSelection(int containerNumber) {
    _selectedColorScheme = containerNumber;
    notifyListeners();
  }

  //Загрузка темы

  Future<void> loadTheme() async {
    final int themePreference = await _themePreferences.getThemePreference();
    final int colorScheme = await _themePreferences.getColorSchemePreference();
    int selectedColorScheme =
        await _themePreferences.getColorSchemePreference();

    toggleSelection(selectedColorScheme);

    final bool themeLite;

    themePreference == 0 ? themeLite = false : themeLite = true;

    _themeData = MyThemes.getTheme(colorScheme, themeLite);

    notifyListeners();
  }

  //Сохранение темы

  Future<void> saveTheme(int colorScheme) async {
    await _themePreferences
        .saveThemePreference(_themeData.brightness == Brightness.dark ? 1 : 0);
    await _themePreferences.saveColorSchemePreference(colorScheme);
  }
}
