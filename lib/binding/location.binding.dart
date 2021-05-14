import 'package:get/get.dart';
import 'package:weather_app/controller/location.controller.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LocationController());
  }
}
