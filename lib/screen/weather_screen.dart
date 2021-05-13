import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  dynamic weatherData = Get.arguments;
  String cityName;
  double temp;
  void initState() {
    super.initState();
    updateData();
  }

  void updateData() {
    temp = weatherData['main']["temp"];
    cityName = weatherData['name'];
    print(cityName);
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text("${cityName}"),
          Text("${temp}"),
        ],
      ),
    ));
  }
}
