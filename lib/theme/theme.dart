import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 243, 247, 250),
    // surface: Colors.white,
    // primary: Colors.white,
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade200,
  ),
  fontFamily: 'SofiaPro',
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
  fontFamily: 'SofiaPro',
);
