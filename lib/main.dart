import 'package:animations_course/chip.dart' as chip;
import 'package:animations_course/example1.dart';
import 'package:animations_course/example2.dart';
import 'package:animations_course/example3.dart';
import 'package:animations_course/menu/menu_page.dart';
import 'package:animations_course/rive_example.dart';
import 'package:animations_course/lottie_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const MenuPage(),
    );
  }
}
