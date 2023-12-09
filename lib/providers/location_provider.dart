import 'package:flutter/material.dart';
import 'package:flutter_map/services/location_service.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  Location location = Location();
  bool feaching = false;
  LocationData? currentLocation;
  String? latitude;
  String? longitude;

  void getCurrentLocation() async {
    feaching = true;
    notifyListeners();

    if ((await LocationService.instance
        .checkForLocationserviceAvailability())) {
      currentLocation = await location.getLocation();
      latitude = currentLocation?.latitude?.toString();
      longitude = currentLocation?.longitude?.toString();
      feaching = false;
      notifyListeners();
    } else {
      latitude = "Service is not available";
      longitude = "Service is not available";
      feaching = false;
      notifyListeners();
    }
  }
}
