import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

// StatelessWidget에서 Data Fetching 할 수 있음 : FutureBuilder
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // 목표 : Future 기다리기 + 결과가 나왔을 때 build 재실행하기
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        // future : await 처리 할 대상
        future: webtoons,
        builder: (context, snapshot) {
          // snapshot : future의 상태
          if (snapshot.hasData) {
            return const Text("There is Data!");
          }
          return const Text("Loading...");
        },
      ),
    );
  }
}
