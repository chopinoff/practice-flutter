import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroHomeScreen extends StatefulWidget {
  const PomodoroHomeScreen({super.key});

  @override
  State<PomodoroHomeScreen> createState() => _PomodoroHomeScreenState();
}

class _PomodoroHomeScreenState extends State<PomodoroHomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  int totalPomodoros = 0;
  bool isRunning = false;
  bool isStarted = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      timer.cancel();
      setState(() {
        totalSeconds = twentyFiveMinutes;
        totalPomodoros += 1;
        isRunning = false;
      });
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
      isStarted = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  // Code Challenge : totalSeconds를 reset하는 함수 만들기
  // Custom Details
  // 1. totalSeconds가 1500일 경우에는 ResetIcon 노출하지 않음
  // - isStarted로 관리 (start 후 reset되기 전까지 true)
  // 2. isRunning일 때 배경 색상 변경

  void onResetPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = twentyFiveMinutes;
      isRunning = false;
      isStarted = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds).toString().split(".");
    var formattedSeconds = duration.first.substring(2);
    return formattedSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isRunning
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).textTheme.displayLarge?.color,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
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
            child: Column(
              children: [
                // Expanded와 Flexible은 유사한 Widget
                // 공통점
                // 1. flex(차지하는 비율)을 설정할 수 있음
                // 2. Column, Row의 children에서만 사용할 수 있음
                // 차이점
                // - Expanded : 남아있는 공간 전부를 비율만큼 차지함
                // - Flexible : 남아있는 공간을 차지하지만, child Widget이 공간을 전부 차지하지 않으면 나머지 공간은 버림
                // - Expanded는 차지하는 비율, Flexible은 버리는 비율
                Expanded(
                  flex: 3,
                  child: IconButton(
                    alignment: Alignment.bottomCenter,
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
                Expanded(
                  flex: 2,
                  child: isStarted
                      ? IconButton(
                          alignment: Alignment.topCenter,
                          onPressed: onResetPressed,
                          color: Theme.of(context).cardColor,
                          icon: const Icon(Icons.refresh_outlined),
                          iconSize: 50,
                        )
                      // SizedBox.shrink() : 빈 위젯, 가장 작은 크기를 가짐
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
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
                          "$totalPomodoros",
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
