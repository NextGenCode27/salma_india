import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salam_india/models/allah_names_model.dart';

class AllahNameProvider extends ChangeNotifier {
  // ignore: body_might_complete_normally_nullable
  Future<AllaNamesModel?> getAllahName() async {
    const String url =
        "https://api.aladhan.com/v1/asmaAlHusna/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99";
    final Uri uri = Uri.parse(url);
    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final AllaNamesModel nameData = AllaNamesModel.fromJson(body);
      nameData;

      notifyListeners();
      return nameData;
    }
  }
}
