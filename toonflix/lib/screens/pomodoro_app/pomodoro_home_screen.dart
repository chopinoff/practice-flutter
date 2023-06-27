import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroHomeScreen extends StatefulWidget {
  const PomodoroHomeScreen({super.key});

  @override
  State<PomodoroHomeScreen> createState() => _PomodoroHomeScreenState();
}

class _PomodoroHomeScreenState extends State<PomodoroHomeScreen> {
  int totalSeconds = 1500;
  // Timer : Dart에서 제공하는 기본 type (import 'dart:async'; 필요)
  // late : 당장 초기화하지 않지만 property를 사용하기 전에 초기화하겠다는 의미
  // 여기서는 사용자가 버튼을 누를 때 초기화
  late Timer timer;

  // timer의 callback Function은 인자로 timer을 사용해야 함
  void onTick(Timer timer) {
    setState(() {
      totalSeconds -= 1;
    });
  }

  void onStartPressed() {
    // onTick()이 아닌 onTick을 사용함
    // 이유 : onTick()은 당장 실행한다는 의미, onTick을 사용하면 Timer가 매 초마다 괄호를 넣어서 실행할 예정

    timer = Timer.periodic(const Duration(seconds: 1), onTick);

    // 위 코드는 다음 코드와 같은 의미
    // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   onTick(timer);
    // });
  }

  // Timer과 late의 초기화 시점에 대한 자세한 설명 (by Nico)
  // late 키워드는 Dart에서 지연 초기화 (lazy initialization)를 수행하는 데 사용됩니다.
  // late 키워드로 선언된 변수는 초기화를 나중에 하고, 사용할 때 초기화됩니다.
  // 즉, late 키워드로 선언된 변수는 선언 시점에는 null 값을 가지며, 나중에 해당 변수를 사용하기 전에 초기화를 해주어야 합니다.

  // late Timer timer는 Timer 타입의 timer 변수를 선언하는데, 이 변수는 onStartPressed() 함수가 호출될 때 Timer.periodic() 함수를 통해 초기화됩니다.
  // Timer.periodic() 함수는 지정된 시간 간격으로 주기적으로 호출되는 Timer 객체를 생성합니다.
  // 이 Timer 객체는 onTick 함수를 실행합니다. onTick 함수에서는 setState() 함수를 호출하여 상태를 업데이트합니다.

  // 즉, onStartPressed() 함수가 호출되면 Timer.periodic() 함수가 실행되고, Timer 객체가 생성됩니다.
  // 이 Timer 객체는 지정된 시간 간격으로 onTick 함수를 실행합니다.
  // onTick 함수에서는 setState() 함수를 호출하여 totalSeconds 값을 1씩 감소시킵니다.
  // 따라서 totalSeconds 값이 0이 되면 onTick 함수에서 setState() 함수를 호출하여 상태를 업데이트하고, Timer 객체가 종료됩니다.

  // 즉, late Timer timer는 onStartPressed() 함수가 호출될 때 초기화되며, Timer 객체가 생성됩니다.
  // Timer 객체는 주기적으로 onTick 함수를 실행하며, onTick 함수에서는 상태를 업데이트합니다.
  // 따라서 late Timer timer는 작동 중에 계속 실행되며, onTick 함수에서 상태를 업데이트합니다.

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
                onPressed: onStartPressed,
                color: Theme.of(context).cardColor,
                icon: const Icon(Icons.play_circle_outline),
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
