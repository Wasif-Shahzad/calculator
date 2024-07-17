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
        /* color shceme:
          digits: Color.fromARGB(255, 71, 71, 71)
          ac: Color.fromARGB(255, 116, 116, 116),
          symbols and equal: Colors.orange.shade400
        */
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