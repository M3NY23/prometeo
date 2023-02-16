import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Color.fromARGB(255, 220, 64, 248);
  static const Color backgroundColor = Color.fromARGB(255, 40, 53, 59);

  static final ThemeData lightTheme = ThemeData.light().copyWith();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      iconTheme: const IconThemeData(color: Colors.white),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white)),
      listTileTheme: const ListTileThemeData(iconColor: Colors.white));

  static final selectedListTileTheme = darkTheme.copyWith(
    listTileTheme: const ListTileThemeData(
        iconColor: secondaryColor, textColor: secondaryColor),
  );
}
