import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    // WebtoonModel로 변환한 데이터를 담을 리스트
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");

    // 사용하고자 하는 모든 데이터는 최종적으로 class의 instance가 되어야 함
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // response.body가 String으로 들어오기 때문에 JSON으로 변환
      // ex) "[{"id":"796152","title":"마루는 강쥐","thumb":"Maru.jpg"}]"
      // response.body를 출력했을 때 리스트의 형태를 띄고 있으므로 List<dynamic>으로 타입 지정
      final List<dynamic> webtoons = jsonDecode(response.body);

      // JSON(List<dynamic>)으로 변환한 webtoons의 각 데이터를 WebtoonModel class의 instance로 만든 후 webtoonInstances에 추가
      for (var webtoon in webtoons) {
        final webtoonInstance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(webtoonInstance);
      }
      // 최종적으로 getTodaysToons()는 webtoonInstances를 반환
      return webtoonInstances;
    }
    throw Error();
  }
}
