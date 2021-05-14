import 'package:get/get.dart';

class WeatherController extends GetxService {
  static WeatherController get to => Get.find();

  RxString currentTem = "".obs;
  void setCurrentTem(value) {
    currentTem(value);
  }
}
