import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.light(
            onSurface: Colors.grey.shade100,
            primary: Colors.grey.shade400,
            secondary: Colors.grey.shade300,
            tertiary: Colors.grey.shade800,
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
            onSurface: Colors.grey.shade900,
            primary: Colors.grey.shade500,
            secondary: Colors.grey.shade800,
            tertiary: Colors.grey.shade200,
          ),
        ),
        home: const HomePage());
  }
}
