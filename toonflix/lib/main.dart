import 'package:flutter/material.dart';
import 'package:toonflix/screens/webtoon_app/home_screen.dart';
import 'package:toonflix/utils/status_bar_style.dart';

void main() {
  StatusBarStyle.statusBarStyle;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
