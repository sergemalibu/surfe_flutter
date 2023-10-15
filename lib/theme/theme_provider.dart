import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:surf_flutter_courses_template/res/app_strings.dart';
import 'package:surf_flutter_courses_template/theme/my_theme_color.dart';

import '../res/theme_colors.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  final String _themeKey = AppStrings.themeKey;
  final String _colorSheemKey = AppStrings.colorSheemKey;

  ThemeProvider()
      : _themeData = ThemeData.light().copyWith(
            primaryColor: ThemeColors.primaryColorTheme1,
            iconTheme:
                const IconThemeData(color: ThemeColors.primaryColorTheme1),
            textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ThemeColors.buttonColor),
              ),
            ),
            buttonTheme:
                const ButtonThemeData(buttonColor: ThemeColors.buttonColor)) {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;

  //Выбор темы

  void toggleTheme(int selectedColorScheme, String selectedValueTheme) {
    if (selectedValueTheme == AppStrings.systemThemLite) {
      if (selectedColorScheme == 1) {
        _themeData = ThemeData.light().copyWith(
          extensions: <ThemeExtension>[
            const MyColors(
                schemColor: ThemeColors.shemeColor1,
                selectBorder: ThemeColors.selectBorder1)
          ],
          primaryColor: ThemeColors.primaryColorTheme1,
          iconTheme: const IconThemeData(
            color: ThemeColors.primaryColorTheme1,
          ),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ThemeColors.buttonColor),
          )),
        );
      } else if (selectedColorScheme == 2) {
        _themeData = ThemeData.light().copyWith(
          extensions: <ThemeExtension>[
            const MyColors(
                schemColor: ThemeColors.shemeColor2,
                selectBorder: ThemeColors.selectBorder2)
          ],
          scaffoldBackgroundColor: ThemeColors.scaffoldBackground2,
          primaryColor: ThemeColors.primaryColorTheme2,
          hintColor: ThemeColors.primaryColorTheme2,
          iconTheme: const IconThemeData(color: ThemeColors.buttonColor2),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ThemeColors.buttonColor2),
          )),
        );
      } else {
        _themeData = ThemeData.light().copyWith(
          extensions: <ThemeExtension>[
            const MyColors(
                schemColor: ThemeColors.shemeColor3,
                selectBorder: ThemeColors.selectBorder3)
          ],
          primaryColor: ThemeColors.primaryColorTheme3,
          hintColor: ThemeColors.hintColorTheme3,
          iconTheme: const IconThemeData(color: Colors.orangeAccent),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(ThemeColors.primaryColorTheme3),
          )),
        );
      }
    } else if (selectedValueTheme == AppStrings.systemThemDark) {
      if (selectedColorScheme == 1) {
        _themeData = ThemeData.dark().copyWith(
          extensions: <ThemeExtension>[
            const MyColors(
                schemColor: ThemeColors.shemeColorDark1,
                selectBorder: ThemeColors.selectBorder1)
          ],
          primaryColor: Colors.green,
          scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundDark1,
          iconTheme: const IconThemeData(color: Colors.green),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(ThemeColors.buttonColorDark1),
          )),
        );
      } else if (selectedColorScheme == 2) {
        _themeData = ThemeData.dark().copyWith(
          extensions: <ThemeExtension>[
            const MyColors(
                schemColor: ThemeColors.shemeColorDark2,
                selectBorder: ThemeColors.selectBorder2)
          ],
          dialogBackgroundColor: ThemeColors.modalColorDark2,
          primaryColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.blue),
          scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundDark2,
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(ThemeColors.buttonColorDark2),
          )),
        );
      } else {
        _themeData = ThemeData.dark().copyWith(
          extensions: <ThemeExtension>[
            const MyColors(
                schemColor: ThemeColors.shemeColorDark3,
                selectBorder: ThemeColors.selectBorder3)
          ],
          dialogBackgroundColor: ThemeColors.modalColorDark3,
          primaryColor: Colors.orangeAccent,
          iconTheme: const IconThemeData(color: Colors.orangeAccent),
          scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundDark3,
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(ThemeColors.buttonColorDark3),
          )),
        );
      }
    } else if (selectedValueTheme == AppStrings.systemThem) {
      _loadTheme();
    }

    _saveTheme(selectedColorScheme);
    notifyListeners();
  }

  //Загрузка темы

  Future _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themePreference = prefs.getInt(_themeKey) ?? 0;
    int colorSheem = prefs.getInt(_colorSheemKey) ?? 0;

    themePreference == 0
        ? _themeData = ThemeData.light()
        : _themeData = ThemeData.dark();

    bool themeLite;
    if (themePreference == 0) {
      themeLite = true;
    } else {
      themeLite = false;
    }

    if (colorSheem == 2) {
      _themeData = _themeData.copyWith(
        extensions: <ThemeExtension>[
          MyColors(
              schemColor: themeLite
                  ? ThemeColors.shemeColor2
                  : ThemeColors.shemeColorDark2,
              selectBorder: ThemeColors.selectBorder2)
        ],
        dialogBackgroundColor:
            themeLite ? ThemeColors.modalColor2 : ThemeColors.modalColorDark2,
        primaryColor: ThemeColors.primaryColorTheme2,
        hintColor: ThemeColors.buttonColor2,
        scaffoldBackgroundColor: themeLite
            ? ThemeColors.scaffoldBackground2
            : ThemeColors.scaffoldBackgroundDark2,
        iconTheme: const IconThemeData(color: ThemeColors.primaryColorTheme2),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ThemeColors.buttonColor2),
          ),
        ),
      );
    } else if (colorSheem == 3) {
      _themeData = themeData.copyWith(
        extensions: <ThemeExtension>[
          MyColors(
              schemColor: themeLite
                  ? ThemeColors.shemeColor3
                  : ThemeColors.shemeColorDark3,
              selectBorder: ThemeColors.selectBorder3)
        ],
        dialogBackgroundColor:
            themeLite ? ThemeColors.modalColor2 : ThemeColors.modalColorDark3,
        primaryColor: ThemeColors.primaryColorTheme3,
        hintColor: ThemeColors.hintColorTheme3,
        scaffoldBackgroundColor: themeLite
            ? ThemeColors.scaffoldBackground3
            : ThemeColors.scaffoldBackgroundDark3,
        iconTheme: const IconThemeData(color: ThemeColors.primaryColorTheme3),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(ThemeColors.buttonColorDark3),
          ),
        ),
      );
    } else {
      _themeData = themeData.copyWith(
        extensions: <ThemeExtension>[
          MyColors(
              schemColor: themeLite
                  ? ThemeColors.shemeColor1
                  : ThemeColors.shemeColorDark1,
              selectBorder: ThemeColors.selectBorder1)
        ],
        primaryColor: ThemeColors.primaryColorTheme1,
        scaffoldBackgroundColor: themeLite
            ? ThemeColors.scaffoldBackground1
            : ThemeColors.scaffoldBackgroundDark1,
        iconTheme: const IconThemeData(color: ThemeColors.primaryColorTheme1),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(ThemeColors.buttonColorDark1),
          ),
        ),
      );
    }

    notifyListeners();
  }

  //Cохранение темы
  void _saveTheme(colorSheem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themeKey, _themeData.brightness == Brightness.dark ? 1 : 0);
    prefs.setInt(_colorSheemKey, colorSheem);
  }
}
