// To parse this JSON data, do
//
//     final allaNamesModel = allaNamesModelFromJson(jsonString);

import 'dart:convert';

AllaNamesModel allaNamesModelFromJson(String str) =>
    AllaNamesModel.fromJson(json.decode(str));

String allaNamesModelToJson(AllaNamesModel data) => json.encode(data.toJson());

class AllaNamesModel {
  AllaNamesModel({
    required this.code,
    required this.status,
    required this.data,
  });

  int code;
  String status;
  List<Datum> data;

  factory AllaNamesModel.fromJson(Map<String, dynamic> json) => AllaNamesModel(
        code: json["code"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.name,
    required this.transliteration,
    required this.number,
    required this.en,
  });

  String name;
  String transliteration;
  int number;
  En en;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        transliteration: json["transliteration"],
        number: json["number"],
        en: En.fromJson(json["en"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "transliteration": transliteration,
        "number": number,
        "en": en.toJson(),
      };
}

class En {
  En({
    required this.meaning,
  });

  String meaning;

  factory En.fromJson(Map<String, dynamic> json) => En(
        meaning: json["meaning"],
      );

  Map<String, dynamic> toJson() => {
        "meaning": meaning,
      };
}
