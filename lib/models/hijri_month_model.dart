// To parse this JSON data, do
//
//     final hijriMonthModel = hijriMonthModelFromJson(jsonString);

import 'dart:convert';

HijriMonthModel hijriMonthModelFromJson(String str) =>
    HijriMonthModel.fromJson(json.decode(str));

String hijriMonthModelToJson(HijriMonthModel data) =>
    json.encode(data.toJson());

class HijriMonthModel {
  HijriMonthModel({
    required this.code,
    required this.status,
    required this.data,
  });

  int code;
  String status;
  List<Datum> data;

  factory HijriMonthModel.fromJson(Map<String, dynamic> json) =>
      HijriMonthModel(
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
    required this.hijri,
    required this.gregorian,
  });

  Hijri hijri;
  Gregorian gregorian;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        hijri: Hijri.fromJson(json["hijri"]),
        gregorian: Gregorian.fromJson(json["gregorian"]),
      );

  Map<String, dynamic> toJson() => {
        "hijri": hijri.toJson(),
        "gregorian": gregorian.toJson(),
      };
}

class Gregorian {
  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  String date;
  Format format;
  String day;
  GregorianWeekday weekday;
  GregorianMonth month;
  String year;
  Designation designation;

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        format: formatValues.map[json["format"]]!,
        day: json["day"],
        weekday: GregorianWeekday.fromJson(json["weekday"]),
        month: GregorianMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": formatValues.reverse[format],
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
      };
}

class Designation {
  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  Abbreviated abbreviated;
  Expanded expanded;

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: abbreviatedValues.map[json["abbreviated"]]!,
        expanded: expandedValues.map[json["expanded"]]!,
      );

  Map<String, dynamic> toJson() => {
        "abbreviated": abbreviatedValues.reverse[abbreviated],
        "expanded": expandedValues.reverse[expanded],
      };
}

enum Abbreviated { AD, AH }

final abbreviatedValues =
    EnumValues({"AD": Abbreviated.AD, "AH": Abbreviated.AH});

enum Expanded { ANNO_DOMINI, ANNO_HEGIRAE }

final expandedValues = EnumValues({
  "Anno Domini": Expanded.ANNO_DOMINI,
  "Anno Hegirae": Expanded.ANNO_HEGIRAE
});

enum Format { DD_MM_YYYY }

final formatValues = EnumValues({"DD-MM-YYYY": Format.DD_MM_YYYY});

class GregorianMonth {
  GregorianMonth({
    required this.number,
    required this.en,
  });

  int number;
  PurpleEn en;

  factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
        number: json["number"],
        en: purpleEnValues.map[json["en"]]!,
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": purpleEnValues.reverse[en],
      };
}

enum PurpleEn { JANUARY }

final purpleEnValues = EnumValues({"January": PurpleEn.JANUARY});

class GregorianWeekday {
  GregorianWeekday({
    required this.en,
  });

  String en;

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) =>
      GregorianWeekday(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class Hijri {
  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  String date;
  Format format;
  String day;
  HijriWeekday weekday;
  HijriMonth month;
  String year;
  Designation designation;
  List<dynamic> holidays;

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json["date"],
        format: formatValues.map[json["format"]]!,
        day: json["day"],
        weekday: HijriWeekday.fromJson(json["weekday"]),
        month: HijriMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
        holidays: List<dynamic>.from(json["holidays"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": formatValues.reverse[format],
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
        "holidays": List<dynamic>.from(holidays.map((x) => x)),
      };
}

class HijriMonth {
  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
  });

  int number;
  FluffyEn en;
  Ar ar;

  factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
        number: json["number"],
        en: fluffyEnValues.map[json["en"]]!,
        ar: arValues.map[json["ar"]]!,
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": fluffyEnValues.reverse[en],
        "ar": arValues.reverse[ar],
      };
}

enum Ar { EMPTY, AR }

final arValues = EnumValues({"رَجَب": Ar.AR, "جُمادى الآخرة": Ar.EMPTY});

enum FluffyEn { JUMD_AL_KHIRAH, RAJAB }

final fluffyEnValues = EnumValues(
    {"Jumādá al-ākhirah": FluffyEn.JUMD_AL_KHIRAH, "Rajab": FluffyEn.RAJAB});

class HijriWeekday {
  HijriWeekday({
    required this.en,
    required this.ar,
  });

  String en;
  String ar;

  factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
