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
  var year, month, day, hour, minute;

  void init() async {
    //현재시간 얻어오기
    year = await DateTime.now().year;
    month = await DateTime.now().month;
    day = await DateTime.now().day;
    hour = await DateTime.now().hour;
    minute = await DateTime.now().minute;
    if (day < 10) {
      day = "0" + day.toString();
    }
    if (month < 10) {
      month = "0" + month.toString();
    }
    if (hour < 10) {
      hour = "0" + hour.toString();
    }
    if (minute < 10) {
      hour = "0" + hour.toString();
    }
    //location 얻어오기
    await getLocation();
    //weather api 호출
    await getWeatherData();

    await getWeatherWeeklyData();

    await 1.delay();
    Get.offNamed("/home", arguments: hour);
  }

  void getLocation() async {
    //현재 lat lon 가져오기
    MyLocation myLocation = new MyLocation();
    await myLocation.getMyCurrentLocation();
    controller.setLocation(myLocation.lat, myLocation.lon);
    controller.setAddress(myLocation.area, myLocation.locality,
        myLocation.thoroughfare, myLocation.address);
    print(myLocation.address);

    //가져온 lat lon값 기상청 정보 사용하기위해 격자값으로 변환
    Conversion conversion = new Conversion();
    await conversion.location_conversion(myLocation.lat, myLocation.lon);
    controller.setGridLocation(conversion.grid_lat, conversion.grid_lon);
  }

  Future<void> getWeatherData() async {
    String url =
        'http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtFcst?serviceKey=${apikey}&pageNo=1&numOfRows=100&dataType=json&base_date=${year}${month}${day}&base_time=${hour}${minute}&nx=${controller.grid_lat}&ny=${controller.grid_lon}';
    // String url =
    //     "https://api.openweathermap.org/data/2.5/onecall?lat=${controller.lat}&lon=${controller.lon}&exclude=hourly&appid=132a053a5227678b54b4d03157a806b1&units=metric&lang=kr";
    Weather weather = new Weather(url);
    var weatherData = await weather.getJsonData();
    // print(weatherData["daily"]);
    // var temp = weatherData["daily"][0]["temp"];
    // var weathers = weatherData["daily"][0]["temp"];
    String precipitationdata =
        weatherData["response"]["body"]["items"]["item"][6]["fcstValue"];
    String skydata =
        weatherData["response"]["body"]["items"]["item"][18]["fcstValue"];
    String tempdata =
        weatherData["response"]["body"]["items"]["item"][24]["fcstValue"];
    WeatherController.to.setWeather(precipitationdata, skydata, tempdata);
    print("data $precipitationdata $skydata $tempdata");
  }

  Future<void> getWeatherWeeklyData() async {
    String url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=${controller.lat}&lon=${controller.lon}&exclude=hourly&appid=132a053a5227678b54b4d03157a806b1&units=metric&lang=kr";
    Weather weather = new Weather(url);
    var weatherData = await weather.getJsonData();
    WeatherController.to.setWeeklyWeater(
        weatherData["daily"][0],
        weatherData["daily"][1],
        weatherData["daily"][2],
        weatherData["daily"][3],
        weatherData["daily"][4],
        weatherData["daily"][5],
        weatherData["daily"][6]);
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
