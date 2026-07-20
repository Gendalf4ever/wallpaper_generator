import 'package:flutter/material.dart';

class VisualSettings {
  static const double borderRadius = 10.0;
  static const double defaultPadding = 20.0;

  //light theme

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueGrey[800],
    colorScheme: ColorScheme.light(
      primary: Colors.blueGrey[800]!,
      secondary: Colors.blueGrey[600]!,
      surface: Colors.grey[100]!,
      onSurface: Colors.black87,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0,
    )
  );
  //dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: Colors.blueAccent,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueAccent.shade700,
      secondary: Colors.blue,
      surface: const Color(0xFF1E1E1E),
      onSurface: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}