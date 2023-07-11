import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  // URL에 요청을 보내기 위해서 http 패키지를 설치해야 함
  // pub.dev : Dart, Flutter 공식 패키지 보관소

  // 패키지 설치 방법
  // 1. with Dart : `dart pub add 패키지 이름`
  // 2. wit Flutter : `flutter pub add 패키지 이름`
  // 3. pubspec.yaml : dependencies에 패키지 추가 후 다운로드

  void getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");

    // http.get() : URL에 get요청을 보내는 함수, Future<Response>를 반환

    // Future과 Response
    // Future : 미래에 받을 값의 타입
    // Response : http 응답의 타입
    // Future<Response> : 해당 함수가 완료 되었을 때 Resposne를 반환할 것이라는 의미

    // 비동기 (async-await)
    // http.get()가 response를 모두 받아올 때까지 다음 함수를 실행하지 않고 기다려야 함
    // await : 해당 함수가 완료될 때까지 기다림, async 함수 내에서만 사용할 수 있음
    // async : 비동기 함수, Future를 반환
    // await http.get(url)의 type은 Response : 완료된 후에는 Response를 반환하기 때문

    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
