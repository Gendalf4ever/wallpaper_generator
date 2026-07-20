import 'package:flutter/material.dart';
import 'package:wallpaper_generator/ui/visualSettings.dart';
import 'ui/homePage.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Generator',
      theme: VisualSettings.lightTheme,
      darkTheme: VisualSettings.darkTheme,
      themeMode: _themeMode, 
      home: HomePage(onThemeChanged: toggleTheme),
    );
  }
}