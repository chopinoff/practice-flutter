import 'package:flutter/material.dart';

class PomodoroTheme {
  static final mainTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE7676C),
      background: const Color(0xFFE7676C),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF232B55),
      ),
    ),
    cardColor: const Color(0xFFF4EDDB),
  );
}
