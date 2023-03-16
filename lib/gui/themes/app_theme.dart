import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromARGB(255, 73, 14, 237);
  static const Color secondaryColor = Color.fromARGB(255, 220, 64, 248);
  static const Color thirdColor = Color.fromARGB(255, 63, 9, 133);
  static const Color backgroundColor = Color.fromARGB(255, 14, 25, 30);
  static const Color fourthColor = Color.fromARGB(255, 35, 35, 35);
  static const Color sideBarColor = Color.fromARGB(255, 35, 35, 35);

  static final ThemeData lightTheme = ThemeData.light().copyWith();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      appBarTheme: const AppBarTheme().copyWith(backgroundColor: fourthColor),
      menuBarTheme: MenuBarThemeData(
          style: MenuStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Colors.transparent),
              elevation: MaterialStateProperty.resolveWith((states) => 0))),
      menuButtonTheme: MenuButtonThemeData(
          style: MenuItemButton.styleFrom(
            backgroundColor: fourthColor,
            alignment: Alignment.center)),
      iconTheme: const IconThemeData(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: thirdColor,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.white))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white)),
      listTileTheme: const ListTileThemeData(iconColor: Colors.white));

  static final selectedListTileTheme = darkTheme.copyWith(
    listTileTheme: const ListTileThemeData(
        iconColor: secondaryColor, textColor: secondaryColor),
  );

  static final windowControlButtonStyle = ElevatedButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ));
}
