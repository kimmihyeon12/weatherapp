import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screen/weather_screen.dart';

const apikey = '132a053a5227678b54b4d03157a806b1';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double getlat;
  double getlon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async {
    MyLocation myLocation = new MyLocation();
    //await 로 기다리는것 futrue 타입이여야함
    await myLocation.getMyCurrentLocation();
    getlat = myLocation.lat;
    getlon = myLocation.lon;
    print("위도:$getlat 경도:$getlon");
    Network network = new Network(
        "https://api.openweathermap.org/data/2.5/weather?lat=${getlat}&lon=${getlon}&appid=${apikey}&units=metric");
    var weatherData = await network.getJsonData();
    print(weatherData);
    //Get.to(WeatherScreen(), arguments: weatherData);
  }

  void fetchData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFFEB9A),
        child: Center(child: Image.asset("./assets/Loading/loading.png")),
      ),
    );
  }
}
