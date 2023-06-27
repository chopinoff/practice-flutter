import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroHomeScreen extends StatefulWidget {
  const PomodoroHomeScreen({super.key});

  @override
  State<PomodoroHomeScreen> createState() => _PomodoroHomeScreenState();
}

class _PomodoroHomeScreenState extends State<PomodoroHomeScreen> {
  int totalSeconds = 1500;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totalSeconds -= 1;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);

    // timer에서 callback function으로 onTick을 사용하기 때문에 setState를 사용하지 않아도 될 것 같지만
    // isRunning의 업데이트와 동시에 일어나지 않기 때문에 정상적으로 작동하지 않음
    // 따라서 setState를 별도로 꼭 작성해주어야 함
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    // calcel() : Timer을 초기화하는 함수
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 230627 : context 접근하는 코드가 이렇게 구성되는 이유를 정확하게 파악하기
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "$totalSeconds",
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 85,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                onPressed: isRunning ? onPausePressed : onStartPressed,
                color: Theme.of(context).cardColor,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
                iconSize: 110,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                // TODO 230627 : Row, Column, Container, Expended, Center 등 기본 Widget 파악하기
                // TODO 230627 : Container - Row - Column 순으로 배치했을 때 화면 전체를 차지하는 이유 알아보기
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
