import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/features/navigation/navigation_scree.dart';
import 'package:salam_india/provider/adhan_provider.dart';
import 'package:salam_india/provider/location_provider.dart';
import 'package:salam_india/provider/prayer_provider.dart';
import 'package:salam_india/services/location_permission.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final locationProvider = context.read<LocationProvider>();
    final prayerProvider = context.read<PrayerProvider>();
    final adhanProvider = context.read<AdhanProvider>();
    super.initState();
    determinePosition()
        .then((value) => locationProvider
            .getCoordinates()
            .then(
              (value) => locationProvider.addressFromCoordinates(
                  latitude: locationProvider.latitude,
                  longitude: locationProvider.longitude),
            )
            .then(
              (value) => prayerProvider.getPrayerData(
                  city: locationProvider.city,
                  country: locationProvider.country),
            ))
        .then((value) => adhanProvider.getAdhanData(
            latitude: locationProvider.latitude,
            longitude: locationProvider.longitude));
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.read<LocationProvider>();
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: locationProvider.getCoordinates(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavigationScreen();
          }
          return Container(
            height: 125,
            width: 125,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31.25),
              image: const DecorationImage(
                image: AssetImage("assets/logo/logo.png"),
                fit: BoxFit.contain,
              ),
              gradient: const LinearGradient(
                colors: [
                  gradientColor1,
                  gradientColor2,
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: iconColor,
                  blurRadius: 30,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
