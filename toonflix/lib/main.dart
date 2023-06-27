import 'package:flutter/material.dart';
import 'package:toonflix/screens/pomodoro_app/pomodoro_home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 강의 예시 코드의 backgroundColor, headline1를 각각 다른 property로 대체 (deprecated)
      // backgroundColor > colorScheme, headline1 > displayLarge
      theme: ThemeData(
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
      ),
      home: const PomodoroHomeScreen(),
    );
  }
}
