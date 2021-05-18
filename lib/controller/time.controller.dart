import 'package:get/get.dart';

class TimeController extends GetxService {
  static TimeController get to => Get.find();
  RxInt year = 0.obs;
  RxInt month = 0.obs;
  RxInt day = 0.obs;
  RxInt hour = 0.obs;
  RxInt minute = 0.obs;
  RxInt weekday = 0.obs;

  void setTime(y, mo, d, h, mi, w) {
    year(y);
    month(mo);
    day(d);
    hour(h);
    minute(mi);
    weekday(w);
  }
}
