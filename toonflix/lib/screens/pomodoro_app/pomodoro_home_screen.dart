import 'package:flutter/material.dart';

class PomodoroHomeScreen extends StatefulWidget {
  const PomodoroHomeScreen({super.key});

  @override
  State<PomodoroHomeScreen> createState() => _PomodoroHomeScreenState();
}

class _PomodoroHomeScreenState extends State<PomodoroHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 230627 : context 접근하는 코드가 이렇게 구성되는 이유를 정확하게 파악하기
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Flexible : UI를 비율에 기반해 유연하게 만들어주는 Widget
          Flexible(
            // flex : 서로간의 크기를 비교해 얼마나 차지하는지 비율 설정
            flex: 1,
            child: Container(
              // alignment : Container의 child(유일한 자식 요소)를 정렬
              alignment: Alignment.bottomCenter,
              child: Text(
                "25:00",
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
                onPressed: () {},
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
                // Row - Container - Column 순으로 있을때는 Column이 화면 가로의 일부만 차지
                // Expended : 화면 전체 영역으로 확장시키는 Widget
                // TODO 230627 : Row, Column, Container, Expended, Center 등 기본 Widget 파악하기
                // TODO 230627 : Container - Row - Column 순으로 배치했을 때 화면 전체를 차지하는 이유 알아보기
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
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
