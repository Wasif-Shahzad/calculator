import 'package:calculator/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(),
          displayLarge: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
      ),
      home: const HomePage(),
    );
  }
}