import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Data Fetching을 위해 변수 선언 후 initState, setState 사용
  // 이 방법보다 훨씬 간단한 방법이 있음 > 다음 챕터에서 확인
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  // webtoon 데이터를 불러와서 빌드를 재실행하는 함수
  void waitForWebtoons() async {
    // await은 setState 내부에 작성할 수 없음
    webtoons = await ApiService.getTodaysToons();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState");
    waitForWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    print(webtoons);
    print(isLoading);

    // print 순서
    // 1. waitForWebtoons가 동기 함수일 때
    // initState > build > webtoons([{ "id":... }, ...]) > isLoading(false)
    // 2. waitForWebtoons가 비동기 함수일 때 (현재)
    // initState > build > webtoons([]) > isLoading(true) > build > webtoons([{ "id":... }, ...]) > isLoading(false)
    // waitForWebtoons를 실행하는 동안 첫번째 build, webtoons, isLoading이 먼저 출력됨

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
