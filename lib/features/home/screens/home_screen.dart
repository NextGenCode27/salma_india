import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';
import 'package:salam_india/features/home/screens/allah_names_screen.dart';
import 'package:salam_india/features/home/widgets/list_tile.dart';
import 'package:salam_india/features/home/widgets/tools_card.dart';
import 'package:salam_india/provider/adhan_provider.dart';
import 'package:salam_india/provider/location_provider.dart';
import 'package:salam_india/provider/prayer_provider.dart';
import 'package:salam_india/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final adhanProvider = context.read<AdhanProvider>();
    final locationProvider = context.read<LocationProvider>();
    super.initState();
    adhanProvider.getAdhanData(
        latitude: locationProvider.latitude,
        longitude: locationProvider.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.read<LocationProvider>();
    final prayerProvider = context.read<PrayerProvider>();
    final adhanProvider = context.read<AdhanProvider>();

    return Scaffold(
      body: FutureBuilder(
          future: locationProvider.addressFromCoordinates(
              latitude: locationProvider.latitude,
              longitude: locationProvider.longitude),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  floating: true,
                  pinned: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: Image.asset("assets/logo/logo.png"),
                      ),
                      Column(
                        children: [
                          Text(
                            "${snapshot.data?[0].locality}",
                            style: textStyleMedium(color: fontColorDark),
                          ),
                          Text("${snapshot.data?[0].country}",
                              style: textStyleNormal(color: fontColorDisabled)),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CustomCard(
                        cardHeight: 220,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/mosque1.png"),
                              fit: BoxFit.cover,
                              opacity: 0.7,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Sunrise",
                                          style: textStyleNormal(
                                              color: fontColorLight
                                                  .withOpacity(0.7)),
                                        ),
                                        Text(
                                          adhanProvider.sunrise,
                                          style: textStyleMedium(
                                              color: fontColorLight),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Sunset",
                                          style: textStyleNormal(
                                              color: fontColorLight
                                                  .withOpacity(0.7)),
                                        ),
                                        Text(adhanProvider.sunset,
                                            style: textStyleMedium(
                                                color: fontColorLight)),
                                      ],
                                    ),
                                  ],
                                ),
                                FutureBuilder(
                                    future: prayerProvider.getPrayerData(
                                        city: locationProvider.city,
                                        country: locationProvider.country),
                                    builder: (context, snapshot) {
                                      final dateEnglish =
                                          snapshot.data?.data.date.gregorian;
                                      final dateHijri =
                                          snapshot.data?.data.date.hijri;
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text("Loading...",
                                            style: textStyleNormal(
                                                color: fontColorLight));
                                      }
                                      return Column(
                                        children: [
                                          Text(
                                            "${dateHijri?.day}, ${dateHijri?.month.en}, ${dateHijri?.year} ${dateHijri?.designation.abbreviated}",
                                            style: textStyleMedium(
                                                color: fontColorLight),
                                          ),
                                          Text(
                                            "${dateEnglish?.weekday.en}, ${dateEnglish?.month.en} ${dateEnglish?.day}, ${dateEnglish?.year}",
                                            style: textStyleSmall(
                                                color: fontColorLight
                                                    .withOpacity(0.7)),
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomCard(
                        cardHeight: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/ramadan.png"),
                              fit: BoxFit.cover,
                              opacity: 0.4,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: FutureBuilder(
                                future: adhanProvider.getAdhanData(
                                    latitude: locationProvider.latitude,
                                    longitude: locationProvider.longitude),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("Loading...",
                                        style: textStyleNormal(
                                            color: fontColorLight));
                                  }
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Current Prayer",
                                                style: textStyleNormal(
                                                    color: fontColorLight
                                                        .withOpacity(0.7)),
                                              ),
                                              Text(
                                                "${snapshot.data?.currentPrayer(date: DateTime.now())}",
                                                style: textStyleMedium(
                                                  color: fontColorLight,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Next Prayer",
                                                style: textStyleNormal(
                                                    color: fontColorLight
                                                        .withOpacity(0.7)),
                                              ),
                                              Text(
                                                "${snapshot.data?.nextPrayer(date: DateTime.now())}",
                                                style: textStyleMedium(
                                                  color: fontColorLight,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          elevation: 25,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/mosque1.png"),
                                fit: BoxFit.cover,
                                opacity: 0.1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Prayer Times",
                                      style:
                                          textStyleLarge(color: fontColorDark),
                                    ),
                                    IconButton(
                                      style: IconButton.styleFrom(
                                          backgroundColor:
                                              iconColor.withOpacity(0.2)),
                                      onPressed: () {},
                                      icon: const Icon(Icons.notifications),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListTilePrayer(
                                  namazName: "Fajr",
                                  namazTime: adhanProvider.fajr,
                                ),
                                ListTilePrayer(
                                  namazName: "Dhuhr",
                                  namazTime: adhanProvider.dhuhr,
                                ),
                                ListTilePrayer(
                                  namazName: "Asr",
                                  namazTime: adhanProvider.asr,
                                ),
                                ListTilePrayer(
                                  namazName: "Maghrib",
                                  namazTime: adhanProvider.maghrib,
                                ),
                                ListTilePrayer(
                                  namazName: "Isha",
                                  namazTime: adhanProvider.isha,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ToolsCard(
                        title: "99 Names",
                        description: "99 Names of allah",
                        image: "assets/images/book.png",
                        buttonName: "Read",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllahNamesScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
