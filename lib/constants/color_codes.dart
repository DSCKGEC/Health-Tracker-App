import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary = Color.fromARGB(203, 87, 14, 190);
  static const white = Color(0xFFF9FAFE);
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}