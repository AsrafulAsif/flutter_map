import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  Location location = Location();
  LocationData? currentLocation;
  String? latitude;
  String? longitude;

  
  void getCurrentLocation() async {
    currentLocation = await location.getLocation();
    latitude = currentLocation?.latitude?.toString();
    longitude = currentLocation?.longitude?.toString();
    notifyListeners();
  }
}
