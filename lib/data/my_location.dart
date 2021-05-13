import 'package:geolocator/geolocator.dart';

class MyLocation {
  double lat;
  double lon;
  Future<void> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      // deny , no wify(앱충돌방지)
      print('위치경도 존재하지 않음!');
    }
  }
}
