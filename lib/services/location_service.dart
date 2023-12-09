import 'package:location/location.dart';

class LocationService {
  LocationService.init();
  static LocationService instance = LocationService.init();

  final Location _location = Location();

  Future<bool> checkForLocationserviceAvailability() async {
    bool isEnabled = await _location.serviceEnabled();
    if (isEnabled) {
      return Future.value(true);
    }

    isEnabled = await _location.requestService();

    if (isEnabled) {
      return Future.value(true);
    }

    return Future.value(false);
  }

  // Future<bool> checkForLocationPermission() async {
  //   PermissionStatus status = await _location.hasPermission();
  //   if (status == PermissionStatus.denied) {
  //     status = await _location.requestPermission();
  //     if (status == PermissionStatus.granted) {
  //       return true;
  //     }
  //     return false;
  //   }
  //   if (status == PermissionStatus.deniedForever) {
  //     return false;
  //   }

  //   return Future.value(true);
  // }
}
