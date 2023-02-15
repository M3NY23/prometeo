import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.blue;

  static final ThemeData lightTheme = ThemeData.light().copyWith();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      iconTheme: const IconThemeData(color: Colors.white),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white)),
      listTileTheme: const ListTileThemeData(iconColor: Colors.white));
}
