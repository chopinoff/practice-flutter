import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// Stateful Widget : 상태를 가지고 있는 Widget
// 상태에 따라 변하는 데이터를 실시간으로 반영함

// Stateful Wiget 만들기
// 방법 1 : `st` 입력 후 Flutter Stateful Widget 선택 (단축키)
// 방법 2 : 기존의 StatelessWidget을 StatefulWidget으로 변경 (Ctrl + .)

// Stateful Widget은 두 가지 부분으로 나뉨
// 1. 상태가 없는 위젯
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// 2. 위젯의 상태 : 위젯에 들어갈 데이터와 UI가 들어감, 데이터가 들어가면 해당 위젯의 UI도 변경
// Stateful Widget의 데이터는 단순히 class의 property임
class _AppState extends State<App> {
  int counter = 0;

  // IconButton 클릭 시 counter가 증가하도록 설정했으나 동작하지 않는 이유는?
  // >> build가 다시 실행되지 않았기 때문
  void onClicked() {
    // setState : State class에게 데이터가 변경되었다고 알리는 함수
    // setState를 실행하면 build를 다시 실행함 (update함)
    // setState와 함수를 각각 작성해도 되지만 가독성을 위해 내부에 작성함
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Click Count",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              // IconButton : 아이콘을 가지는 Button Widget, onPressed에 클릭 시 실행되는 함수를 입력
              IconButton(
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
                iconSize: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
