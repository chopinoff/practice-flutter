import 'package:flutter/material.dart';
import 'package:toonflix/screens/pomodoro_app/pomodoro_home_screen.dart';
import 'package:toonflix/themes/pomodoro_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PomodoroTheme.mainTheme,
      home: const PomodoroHomeScreen(),
    );
  }
}
