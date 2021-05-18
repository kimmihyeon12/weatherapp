import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/weather.dart';
import 'package:weather_app/controller/location.controller.dart';
import 'package:weather_app/controller/time.controller.dart';
import 'package:weather_app/controller/weather.controller.dart';

import 'package:weather_app/data/my_location.dart';

const apikey = '132a053a5227678b54b4d03157a806b1';

class Loading extends GetView<LocationController> {
  int year, month, day, hour, minute, weekday;

  void init() async {
    //현재시간 얻어오기
    year = DateTime.now().year;
    month = DateTime.now().month;
    day = DateTime.now().day;
    hour = DateTime.now().hour;
    minute = DateTime.now().minute;
    weekday = DateTime.parse(DateTime.now().toString()).weekday.toInt();

    TimeController.to.setTime(year, month, day, hour, minute, weekday);
    //location 얻어오기
    await getLocation();

    //weather api 호출
    await getWeatherCurrentData();
    await getWeatherWeeklyData();
    await getWeatherDailyData();

    Get.offNamed("/home");
  }

  Future getLocation() async {
    //현재 lat lon 가져오기
    MyLocation myLocation = new MyLocation();
    await myLocation.getMyCurrentLocation();
    controller.setLocation(myLocation.lat, myLocation.lon);
    controller.setAddress(myLocation.area, myLocation.locality,
        myLocation.thoroughfare, myLocation.address);
    print(myLocation.address);
  }

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
      "windspeed": weatherData["wind"]["speed"],
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
    ScreenUtil.init(context, width: 1080, height: 1920);
    return Scaffold(
      body: Container(
        height: 1920.h,
        width: 1080.w,
        child: Image.asset(
          "./assets/Loading/loading.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
