import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFAF85D1), // Primary color
      brightness: Brightness.light,
      primary: const Color(0xFFAF85D1),  // Primary color
      secondary: const Color(0xFFfed4de),  // Secondary color
    ),
    useMaterial3: true,
  );
}