import 'package:geocoder/geocoder.dart';
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

      var coordinates = new Coordinates(35.1747854, 126.9354199);
      var address =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = address.first;
      String area = first.adminArea != null
          ? first.adminArea.toString()
          : first.subAdminArea.toString();
      String locality = first.locality != null
          ? first.locality.toString()
          : first.subLocality.toString();
      String thoroughfare = first.thoroughfare != null
          ? first.thoroughfare.toString()
          : first.subThoroughfare.toString();
      print("address ${area} ${locality} ${thoroughfare}");
    } catch (e) {
      // deny , no wify(앱충돌방지)
      print('MyLocation error!');
    }
  }
}
