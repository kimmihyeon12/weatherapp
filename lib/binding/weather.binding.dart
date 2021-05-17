import 'package:get/get.dart';
import 'package:weather_app/controller/location.controller.dart';
import 'package:weather_app/controller/weather.controller.dart';

class WeatherBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<WeatherController>(WeatherController());
  }
}
