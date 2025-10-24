import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SofiaPro',
  colorScheme: ColorScheme.light(
    primary: Color(0xFFFF6B00),
    primaryContainer: Color(0xFFE65F00),
    secondary: Color(0xFFFB923C),
    tertiary: Color(0xFF3B82F6),
    error: Color(0xFFFF3B3B),
    errorContainer: Color(0xFFFFD23F),
    surface: Color(0xFFFFFFFF), // lapisan putih untuk card/container
    surfaceContainerLowest: Color(0xFFF7F8FA), // pengganti background lama
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFF222222),
    onSurfaceVariant: Color(0xFF666666),
    outline: Color(0xFFE0E0E0),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SofiaPro',
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFFF6B00),
    primaryContainer: Color(0xFFE65F00),
    secondary: Color(0xFFFB923C),
    tertiary: Color(0xFF3B82F6),
    error: Color(0xFFFF3B3B),
    errorContainer: Color(0xFFFFD23F), // warning fallback
    surface: Color(0xFF1E1E1E),
    surfaceContainerLowest: Color(0xFF121212), // pengganti background lama
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFFFFFFFF),
    onSurfaceVariant: Color(0xFFAAAAAA),
    outline: Color(0xFF2C2C2E),
  ),
);

extension CustomColors on ColorScheme {
  Color get success => const Color(0xFF4CAF50);
  Color get warning => const Color(0xFFFFD23F);
}
