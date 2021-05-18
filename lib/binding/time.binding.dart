import 'package:get/get.dart';

import 'package:weather_app/controller/time.controller.dart';
import 'package:weather_app/controller/weather.controller.dart';

class TimeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TimeController>(TimeController());
  }
}
