import 'package:flutter/material.dart';

void main() {
  // runApp은 위에 import에서 받아온 것
  // 마우스를 올려보면 인자로 Widget이 필요함을 알 수 있음
  // Widget : 화면을 구성하는 요소
  // Widget은 class로 이루어져 있음
  runApp(App());
  // 여기서 App()은 가장 바탕이 되는 root Widget임
}

// App을 단순한 class가 아닌 Widget으로 만들기 위해서는
// Flutter SDK에 있는 3개의 core Widget 중 하나를 상속받아야 함
// 1. StatelessWidget
class App extends StatelessWidget {
  // StatelessWidget를 상속받기 위해서는 build 메소드를 구현해야 함
  // build : return하는 것을 화면에 띄워줌
  @override
  // build는 Widget을 반환하는 함수
  Widget build(BuildContext context) {
    // root Widget이기 때문에 return값을 두 가지 중 하나로 정해야 함
    // 1. MaterialApp(구글 디자인 시스템) 2.CupertinoApp(애플 디자인 시스템)
    // 커스텀 하는 것과는 관계없이 반드시 지정해줘야함
    return MaterialApp(
      // MaterailApp에 마우스를 올리면 나오는 수많은 것 중에서
      // home을 사용해보자
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter!"),
          elevation: 10,
        ),
        body: Center(child: Text("Hello world!")),
      ),
      // Scaffold를 사용해서 화면 구성 요소를 정렬함
    );
  }
}

// class가 끝날 때마다 comma(,)를 찍어주자 > 자동으로 주석 달아줌