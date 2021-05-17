import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/binding/location.binding.dart';
import 'package:weather_app/binding/weather.binding.dart';
import 'package:weather_app/screen/home.dart';
import 'package:weather_app/screen/loading.dart';
import 'package:weather_app/screen/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
            name: "/",
            page: () => Loading(),
            bindings: [WeatherBinding(), LocationBinding()]),
        GetPage(
            name: "/home",
            page: () => Home(),
            bindings: [WeatherBinding(), LocationBinding()]),
      ],
    );
  }
}
