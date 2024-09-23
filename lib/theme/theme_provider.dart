import 'package:flutter/material.dart';
import 'package:untitled/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(bool isDarkMode)
      : _themeData = isDarkMode ? darkMode : lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == darkMode) {
      themeData = lightMode;
    } else {
      themeData = darkMode;
    }
  }
}
