import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  final String url;
  Weather(this.url);

  Future<dynamic> getJsonData() async {
    String url = this.url;
    http.Response response = await http.get(url);
    print(url);
    //앱 성공적으로 실행되었을때 200
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
