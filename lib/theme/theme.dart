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
    // Add this section for BottomNavigationBar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent, // Keep background transparent
      elevation: 0, // Remove shadow
      selectedItemColor: const Color(0xFFAF85D1), // Set selected item color to primary
      unselectedItemColor: Colors.grey, // Keep unselected item color as grey
      showUnselectedLabels: true, // Show labels for unselected items
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold, // Make selected label bold
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal, // Keep unselected label normal
      ),
    ),
  );
}
