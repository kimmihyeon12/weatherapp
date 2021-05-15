import 'package:get/get.dart';

class LocationController extends GetxService {
  static LocationController get to => Get.find();

  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;
  RxString address = "".obs;
  RxInt grid_lat = 0.obs;
  RxInt grid_lon = 0.obs;

  void setLocation(double latitude, double longitude) {
    lat(latitude);
    lon(longitude);
  }

  void setGridLocation(int latitude, int longitude) {
    grid_lat(latitude);
    grid_lon(longitude);
  }

  void setAddress(String value) {
    address(value);
  }
}
