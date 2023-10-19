import 'package:flutter/material.dart';

import '../res/theme_colors.dart';
import 'my_theme_color.dart';

class MyThemes {
  //Тема 1 Светлая

  static ThemeData lightTheme1 = ThemeData.light().copyWith(
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

  //Тема 1 Темная

  static ThemeData darkTheme1 = ThemeData.dark().copyWith(
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
      backgroundColor: MaterialStatePropertyAll(ThemeColors.buttonColorDark1),
    )),
  );

  //Тема 2 Светлая

  static ThemeData lightTheme2 = ThemeData.light().copyWith(
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

  //Тема 2 Темная

  static ThemeData darkTheme2 = ThemeData.dark().copyWith(
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
      backgroundColor: MaterialStatePropertyAll(ThemeColors.buttonColorDark2),
    )),
  );

  //Тема 3 Светлая

  static ThemeData lightTheme3 = ThemeData.light().copyWith(
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
      backgroundColor: MaterialStatePropertyAll(ThemeColors.primaryColorTheme3),
    )),
  );

  //Тема 3 Темная

  static ThemeData darkTheme3 = ThemeData.dark().copyWith(
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
      backgroundColor: MaterialStatePropertyAll(ThemeColors.buttonColorDark3),
    )),
  );

  static ThemeData getTheme(int themeNumber, bool isDarkMode) {
    switch (themeNumber) {
      case 1:
        return isDarkMode ? darkTheme1 : lightTheme1;
      case 2:
        return isDarkMode ? darkTheme2 : lightTheme2;
      case 3:
        return isDarkMode ? darkTheme3 : lightTheme3;
      default:
        return isDarkMode ? darkTheme1 : lightTheme1;
    }
  }
}
