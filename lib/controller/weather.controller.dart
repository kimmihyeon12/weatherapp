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

  final weeklyWeather = <dynamic>[0, 0, 0, 0, 0, 0, 0].obs;

  //set weather
  void setWeather(precipitationdata, skydata, tempdata) {
    currentSkyCode(skydata);
    currentTemp(tempdata);
    currentprecipitationCode(precipitationdata);

    if (currentSkyCode == "1") {
      setSkystatus("맑음");
    } else if (currentSkyCode == "3") {
      setSkystatus("구름많음");
    } else {
      setSkystatus("흐림");
    }

    if (currentprecipitationCode == "1") {
      setprecipitationstatus("비");
    } else if (currentprecipitationCode == "2") {
      setprecipitationstatus("비/눈(진눈개비)");
    } else if (currentprecipitationCode == "3") {
      setprecipitationstatus("눈");
    } else if (currentprecipitationCode == "4") {
      setprecipitationstatus("소나기");
    } else if (currentprecipitationCode == "5") {
      setprecipitationstatus("빗방울");
    } else if (currentprecipitationCode == "6") {
      setprecipitationstatus("빗방울/눈날림");
    } else if (currentprecipitationCode == "7") {
      setprecipitationstatus("눈날림");
    }
  }

  void setSkystatus(value) {
    currentSkystatus(value);
  }

  void setprecipitationstatus(value) {
    currentprecipitationstatus(value);
  }

  void setImage() {
    //맑음
    if (currentSkystatus == "맑음") {
      if (currentprecipitationstatus == "비") {
      } else if (currentprecipitationstatus == "비/눈(진눈개비)") {
      } else if (currentprecipitationstatus == "눈") {
      } else if (currentprecipitationstatus == "소나기") {
      } else if (currentprecipitationstatus == "빗방울") {
      } else if (currentprecipitationstatus == "빗방울/눈날림") {
      } else if (currentprecipitationstatus == "눈날림") {
      } else {}
    } else if (currentSkystatus == "구름많음") {
      if (currentprecipitationstatus == "비") {
      } else if (currentprecipitationstatus == "비/눈(진눈개비)") {
      } else if (currentprecipitationstatus == "눈") {
      } else if (currentprecipitationstatus == "소나기") {
      } else if (currentprecipitationstatus == "빗방울") {
      } else if (currentprecipitationstatus == "빗방울/눈날림") {
      } else if (currentprecipitationstatus == "눈날림") {
      } else {}
    } else {
      if (currentSkystatus == "흐림") {
        if (currentprecipitationstatus == "비") {
        } else if (currentprecipitationstatus == "비/눈(진눈개비)") {
        } else if (currentprecipitationstatus == "눈") {
        } else if (currentprecipitationstatus == "소나기") {
        } else if (currentprecipitationstatus == "빗방울") {
        } else if (currentprecipitationstatus == "빗방울/눈날림") {
        } else if (currentprecipitationstatus == "눈날림") {
        } else {}
      }
    }
  }

  setWeeklyWeater(day1, day2, day3, day4, day5, day6, day7) {
    weeklyWeather[0] = day1;
    weeklyWeather[1] = day2;
    weeklyWeather[2] = day3;
    weeklyWeather[3] = day4;
    weeklyWeather[4] = day5;
    weeklyWeather[5] = day6;
    weeklyWeather[6] = day7;
  }
}
