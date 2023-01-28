import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salam_india/models/hijri_month_model.dart';

class HijriMonthProvider extends ChangeNotifier {
  // ignore: body_might_complete_normally_nullable
  Future<HijriMonthModel?> getHijriMonth({
    required String month,
    required String year,
  }) async {
    final String url = "https://api.aladhan.com/v1/gToHCalendar/$month/$year";
    final Uri uri = Uri.parse(url);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final HijriMonthModel hijriMonthData = HijriMonthModel.fromJson(json);
      print(hijriMonthData.data.length);

      notifyListeners();

      return hijriMonthData;
    }
  }
}
