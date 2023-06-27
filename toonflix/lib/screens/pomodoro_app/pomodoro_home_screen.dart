import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroHomeScreen extends StatefulWidget {
  const PomodoroHomeScreen({super.key});

  @override
  State<PomodoroHomeScreen> createState() => _PomodoroHomeScreenState();
}

class _PomodoroHomeScreenState extends State<PomodoroHomeScreen> {
  // static : class 안에서 해당 변수, 메서드가 인스턴스에 귀속되지 않고 class에 귀속된다는 의미
  // const만 작성할 경우 static을 덧붙이거나 final로 변경하라는 에러 메시지가 뜸
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  int totalPomodoros = 0;
  bool isRunning = false;
  late Timer timer;

  // 아래 함수들에서 timer에 관련된 코드를 setState 안에 넣어도 동작에 이상 없음
  // timer의 변화를 직접적으로 Widget에 연결시킬 필요가 없기 때문에 넣지 않은 것이라 추측
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
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    // Duration : 시간을 다양한 포맷으로 변환하여 반환할 수 있는 Type
    // split : String을 지정한 기호 기준으로 잘라서 List로 반환
    // substring : String을 시작점과 끝점까지 잘라내서 String으로 반환
    var duration = Duration(seconds: seconds).toString().split(".");
    var formattedSeconds = duration.first.substring(2);
    // print(duration) // ["00:25:00", "000"]
    return formattedSeconds;
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
                // 1초마다 다시 build되기 때문에 format도 1초마다 실행됨
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
