import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      onSurface: Colors.grey.shade200,
      primary: Colors.grey.shade400,
      secondary: Colors.grey.shade300,
      tertiary: Colors.grey.shade800,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      onSurface: Colors.grey.shade900,
      primary: Colors.grey.shade600,
      secondary: const Color(0xFF303030),
      tertiary: Colors.grey.shade300,
    ));
