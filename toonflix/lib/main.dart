import 'package:flutter/material.dart';
import 'package:toonflix/screens/webtoon_app/home_screen.dart';
import 'package:toonflix/utils/status_bar_style.dart';

void main() {
  StatusBarStyle.statusBarStyle;
  runApp(const App());
}

class App extends StatelessWidget {
  // 이 Widget의 key(Identifier)를 StatelessWidget이라는 super class로 보냄
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
