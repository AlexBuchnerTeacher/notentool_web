import 'package:flutter/material.dart';

class RbsTheme {
  /// RBS-Styleguide: Hauptfarben
  static const Color primaryRed = Color(0xFFD90429);
  static const Color darkGrey = Color(0xFF2B2D42);
  static const Color lightGrey = Color(0xFF8D99AE);
  static const Color background = Color(0xFFF8F9FA);

  /// Ergänzende Farben
  static const Color dangerColor = Color(0xFFB00020);
  static const Color successColor = Color(0xFF2E7D32);

  /// ThemeData
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryRed,
      primary: primaryRed,
      secondary: darkGrey,
      background: background,
    ),
    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryRed,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryRed,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryRed,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
    dataTableTheme: const DataTableThemeData(
      headingRowColor: MaterialStatePropertyAll(Color(0xFFEDF2F4)),
      headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(primaryRed),
    ),
  );
}
