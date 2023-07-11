class WebtoonModel {
  final String title, thumb, id;

  // TODO 230711 : named constructor 복습하기
  // named constructor 사용
  // Map<K, V> : Key, Value 타입 지정된 Object
  // dynamic이나 Map으로 작성해도 오류는 없지만, 타입을 명확하게 하기 위해 Map<String, dynamic>으로 작성
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}
