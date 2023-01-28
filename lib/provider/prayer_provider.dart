import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salam_india/models/prayer_model.dart';

class PrayerProvider extends ChangeNotifier {
  String _month = "";
  String get month => _month;

  String _year = "";
  String get year => _year;
  // ignore: body_might_complete_normally_nullable
  Future<PrayerModel?> getPrayerData(
      {required String city, required String country}) async {
    final String url =
        "http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=8";
    final Uri uri = Uri.parse(url);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final PrayerModel prayerData = PrayerModel.fromJson(json);
      _month = prayerData.data.date.gregorian.month.number.toString();
      _year = prayerData.data.date.gregorian.year.toString();
      notifyListeners();
      return prayerData;
    }
  }
}
