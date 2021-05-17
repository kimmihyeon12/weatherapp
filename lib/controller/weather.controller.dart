import 'package:get/get.dart';

class WeatherController extends GetxService {
  static WeatherController get to => Get.find();

  //현재기온
  RxString currentTemp = "".obs;
  //구름상태
  // 맑음(1), 구름많음(3), 흐림(4)
  RxString currentSkyCode = "1".obs;
  RxString currentSkystatus = "".obs;
  //강수형태
  //없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4), 빗방울(5), 빗방울/눈날림(6), 눈날림(7)
  RxString currentprecipitationCode = "".obs;
  RxString currentprecipitationstatus = "".obs;

  RxString currentImage = "".obs;
  //final weeklyWeather = <dynamic>[0, 0, 0, 0, 0, 0, 0].obs;

  RxList weeklyWeather = <dynamic>[].obs;
  RxList dailyWeather = <dynamic>[].obs;
  RxList currentWeather = <dynamic>[].obs;

  setCurrentWeather(value) {
    currentWeather.add(value);
  }

  setWeeklyWeater(value) {
    weeklyWeather.add(value);
  }

  void setImage() {}

  setDailyWeater(value) {
    dailyWeather.add(value);
  }
}
