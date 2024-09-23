import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/theme/theme_provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("myBox");

  bool isDarkMode = checkSystemTheme();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(isDarkMode),
    child: const MyApp(),
  ));
}

bool checkSystemTheme() {
  final Brightness brightness = PlatformDispatcher.instance.platformBrightness;
  final bool isDarkMode = brightness == Brightness.dark;
  return isDarkMode;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const HomePage());
  }
}
