import 'package:flutter/material.dart';
import 'package:untitled/util/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData {
    return _themeData;
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData != lightMode) {
      themeData = lightMode;
    } else {
      themeData = darkMode;
    }
  }
}
