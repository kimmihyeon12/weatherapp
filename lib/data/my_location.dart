import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  double lat;
  double lon;
  String area;
  String locality;
  String address;
  String thoroughfare;
  Future<void> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
      print("$lat,$lon");

      var coordinates = new Coordinates(lat, lon);
      var data = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = data.first;
      String area = first.adminArea != null
          ? first.adminArea.toString()
          : first.subAdminArea.toString();
      String locality = first.locality != null
          ? first.locality.toString()
          : first.subLocality.toString();
      String thoroughfare = first.thoroughfare != null
          ? first.thoroughfare.toString()
          : first.subThoroughfare.toString();
      address = ' ${area} ${locality} ${thoroughfare} ';
      print('${first.thoroughfare} ${first.subThoroughfare}');
    } catch (e) {
      // deny , no wify(앱충돌방지)
      print('MyLocation error!');
    }
  }
}
