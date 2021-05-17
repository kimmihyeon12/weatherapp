import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/weather.dart';
import 'package:weather_app/controller/location.controller.dart';
import 'package:weather_app/controller/weather.controller.dart';
import 'package:weather_app/data/latlon_conversion.dart';
import 'package:weather_app/data/my_location.dart';

const apikey = '132a053a5227678b54b4d03157a806b1';

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
    //await getWeatherData();
    await getWeatherCurrentData();
    await getWeatherWeeklyData();

    await getWeatherDailyData();

    //   await 1.delay();
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

  // Future<void> getWeatherData() async {
  //   String url =
  //       'http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtFcst?serviceKey=${apikey}&pageNo=1&numOfRows=100&dataType=json&base_date=${year}${month}${day}&base_time=${hour}${minute}&nx=${controller.grid_lat}&ny=${controller.grid_lon}';
  //   Weather weather = new Weather(url);
  //   var weatherData = await weather.getJsonData();
  //   print(weatherData);
  //   String precipitationdata =
  //       weatherData["response"]["body"]["items"]["item"][6]["fcstValue"];
  //   String skydata =
  //       weatherData["response"]["body"]["items"]["item"][18]["fcstValue"];
  //   String tempdata =
  //       weatherData["response"]["body"]["items"]["item"][24]["fcstValue"];
  //   WeatherController.to.setWeather(precipitationdata, skydata, tempdata);
  //   print("data $precipitationdata $skydata $tempdata");
  // }
  getWeatherCurrentData() async {
    print("current");
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${controller.lat}&lon=${controller.lon}&appid=${apikey}&units=metric&lang=kr";
    Weather weather = new Weather(url);
    var weatherData = await weather.getJsonData();
    Map data = {
      "weather": weatherData["weather"],
      "temp": weatherData["main"]["temp"],
      "humidity": weatherData["main"]["humidity"],
    };

    WeatherController.to.setCurrentWeather(data);
    print(data);
  }

  Future<void> getWeatherDailyData() async {
    String url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=${controller.lat}&lon=${controller.lon}&exclude=current&appid=${apikey}&units=metric&lang=kr";
    Weather weather = new Weather(url);
    var weatherData = await weather.getJsonData();

    for (int i = 0; i < weatherData["hourly"].length; i++) {
      int unixTime = weatherData["hourly"][i]["dt"];
      weatherData["hourly"][i]["dt"] = {
        "day": DateTime.fromMillisecondsSinceEpoch(unixTime * 1000).day,
        "hour": DateTime.fromMillisecondsSinceEpoch(unixTime * 1000).hour
      };

      WeatherController.to.setDailyWeater(weatherData["hourly"][i]);
      print(weatherData["hourly"][i]);
    }
  }

  Future<void> getWeatherWeeklyData() async {
    String url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=${controller.lat}&lon=${controller.lon}&exclude=hourly&appid=${apikey}&units=metric&lang=kr";
    Weather weather = new Weather(url);
    var weatherData = await weather.getJsonData();
    for (int i = 0; i < weatherData["daily"].length; i++) {
      WeatherController.to.setWeeklyWeater(weatherData["daily"][i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    init();

    return Scaffold(
      body: Center(child: Image.asset("./assets/Loading/loading.png")),
    );
  }
}
