import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class AdhanProvider extends ChangeNotifier {
  String _fajr = "";
  String get fajr => _fajr;

  String _dhuhr = "";
  String get dhuhr => _dhuhr;

  String _asr = "";
  String get asr => _asr;

  String _maghrib = "";
  String get maghrib => _maghrib;

  String _isha = "";
  String get isha => _isha;

  String _sunrise = "";
  String get sunrise => _sunrise;

  String _sunset = "";
  String get sunset => _sunset;

  String? _nextNamaz;
  String get nextNamaz => _nextNamaz!;

  Future<PrayerTimes> getAdhanData(
      {required double latitude, required double longitude}) async {
    final location = tz.getLocation("Asia/Kolkata");
    DateTime date = tz.TZDateTime.from(DateTime.now(), location);
    Coordinates coordinates = Coordinates(latitude, longitude);
    CalculationParameters params = CalculationMethod.MuslimWorldLeague();
    params.madhab = Madhab.Hanafi;
    PrayerTimes prayerTimes =
        // ignore: await_only_futures
        await PrayerTimes(coordinates, date, params, precision: true);

    final fajrTime = DateFormat("hh:mm a")
        .format(tz.TZDateTime.from(prayerTimes.fajr!, location));
    final dhuhrTime = DateFormat("hh:mm a")
        .format(tz.TZDateTime.from(prayerTimes.dhuhr!, location));
    final asrTime = DateFormat("hh:mm a")
        .format(tz.TZDateTime.from(prayerTimes.asr!, location));
    final maghribTime = DateFormat("hh:mm a")
        .format(tz.TZDateTime.from(prayerTimes.maghrib!, location));
    final ishaTime = DateFormat("hh:mm a")
        .format(tz.TZDateTime.from(prayerTimes.isha!, location));
    final sunriseTime = DateFormat("hh:mm a")
        .format(tz.TZDateTime.from(prayerTimes.sunrise!, location));
    final sunsetTime = DateFormat("hh:mm a")
        .format(tz.TZDateTime.from(prayerTimes.maghrib!, location));

    _fajr = fajrTime;
    _dhuhr = dhuhrTime;
    _asr = asrTime;
    _maghrib = maghribTime;
    _isha = ishaTime;
    _sunrise = sunriseTime;
    _sunset = sunsetTime;

    notifyListeners();
    return prayerTimes;
  }
}
