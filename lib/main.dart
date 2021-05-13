import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screen/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Weather app',
        theme: ThemeData(primaryColor: Colors.pinkAccent),
        home: Loading());
  }
}
