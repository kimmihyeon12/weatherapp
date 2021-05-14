import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/weather.dart';
import 'package:weather_app/controller/location.controller.dart';
import 'package:weather_app/controller/weather.controller.dart';
import 'package:weather_app/data/latlon_conversion.dart';
import 'package:weather_app/data/my_location.dart';

const apikey =
    'N7SieJxvk8AVxfM4SrmQOiAc5hOjevbbE9DJepEi0ibB1mZ0otnwK9ytSSDwTcxdDR4/X/OtQ8keM0XcEFQ2Gg==';

class Loading extends GetView<LocationController> {
  var year, month, day, hour;

  void init() async {
    //현재시간 얻어오기
    year = await DateTime.now().year;
    month = await DateTime.now().month;
    day = await DateTime.now().day;
    hour = await DateTime.now().hour - 1;
    if (day < 10) {
      day = "0" + day.toString();
    }
    if (month < 10) {
      month = "0" + month.toString();
    }
    if (hour < 10) {
      hour = "0" + hour.toString();
    }
    //location 얻어오기
    await getLocation();
    //weather api 호출
    await getWeatherData();
    await 1.delay();
    Get.offNamed("/home");
  }

  void getLocation() async {
    //현재 lat lon 가져오기
    MyLocation myLocation = new MyLocation();
    await myLocation.getMyCurrentLocation();
    controller.setLocation(myLocation.lat, myLocation.lon);
    //가져온 lat lon값 기상청 정보 사용하기위해 격자값으로 변환
    Map grid_locaion =
        await Conversion.location_conversion(myLocation.lat, myLocation.lon);
    controller.setGridLocation(
        grid_locaion['grid_lat'].toInt(), grid_locaion['grid_lon'].toInt());
  }

  Future<void> getWeatherData() async {
    String url =
        'http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?serviceKey=${apikey}&pageNo=2&numOfRows=20&dataType=json&base_date=${year}${month}${day}&base_time=${hour}00&nx=${controller.grid_lat}&ny=${controller.grid_lon}';
    Weather weather = new Weather(url);
    var weatherData = await weather.getJsonData();
    WeatherController.to.setCurrentTem(
        weatherData["response"]["body"]["items"]["item"][3]["obsrValue"]);
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    init();

    return Scaffold(
      body: Container(
        color: Color(0xffFFEB9A),
        child: Center(child: Image.asset("./assets/Loading/loading.png")),
      ),
    );
  }
}
