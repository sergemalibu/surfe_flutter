import 'package:shared_preferences/shared_preferences.dart';
import '../../res/app_strings.dart';

class ThemePreferences {
  final String _themeKey = AppStrings.themeKey;
  final String _colorSheemKey = AppStrings.colorSheemKey;

  Future<void> saveThemePreference(int themePreference) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themeKey, themePreference);
  }

  Future<void> saveColorSchemePreference(int colorScheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_colorSheemKey, colorScheme);
  }

  Future<int> getThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_themeKey) ?? 0;
  }

  Future<int> getColorSchemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_colorSheemKey) ?? 0;
  }
}
