import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  double _latitude = 0.0;
  double get latitude => _latitude;

  double _longitude = 0.0;
  double get longitude => _longitude;

  List<Placemark> _placemarkList = [];
  List<Placemark> get placemark => _placemarkList;

  String _city = "";
  String get city => _city;

  String _country = "";
  String get country => _country;

  Future<Position> getCoordinates() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _latitude = position.latitude;
    _longitude = position.longitude;
    notifyListeners();
    return position;
  }

  Future<List<Placemark>> addressFromCoordinates(
      {required double latitude, required double longitude}) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    _placemarkList = placemark;
    _city = placemark[0].locality.toString();
    _country = placemark[0].country.toString();
    notifyListeners();
    return placemark;
  }
}
