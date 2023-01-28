import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/primary_swatch.dart';
import 'package:salam_india/features/splash/screens/splash_screen.dart';
import 'package:salam_india/provider/adhan_provider.dart';
import 'package:salam_india/provider/allah_name_provider.dart';
import 'package:salam_india/provider/hijri_month_provider.dart';
import 'package:salam_india/provider/location_provider.dart';
import 'package:salam_india/provider/prayer_provider.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => PrayerProvider()),
        ChangeNotifierProvider(create: (context) => AdhanProvider()),
        ChangeNotifierProvider(create: (context) => AllahNameProvider()),
        ChangeNotifierProvider(create: (context) => HijriMonthProvider()),
      ],
      child: MaterialApp(
        title: 'Salam India',
        theme: ThemeData(
                primarySwatch: Palette.kToDark,
                fontFamily: GoogleFonts.poppins().fontFamily,
                useMaterial3: true)
            .copyWith(
          scaffoldBackgroundColor: scaffoldBgColor,
          appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
