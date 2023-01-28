import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';
import 'package:salam_india/features/home/screens/hijri_calendar_screen.dart';
import 'package:salam_india/provider/hijri_month_provider.dart';
import 'package:salam_india/provider/location_provider.dart';
import 'package:salam_india/provider/prayer_provider.dart';
import 'package:salam_india/widgets/custom_card.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    final hijriMonth = context.read<HijriMonthProvider>();
    final prayerProvider = context.read<PrayerProvider>();
    super.initState();
    hijriMonth.getHijriMonth(
        month: prayerProvider.month, year: prayerProvider.year);
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.read<LocationProvider>();
    final prayerProvider = context.read<PrayerProvider>();
    final today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calendar",
          style: textStyleMedium(color: fontColorDark),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HijriCalendarScreen(),
                ),
              );
            },
            child: CustomCard(
              cardHeight: 130,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/mosque1.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7,
                  ),
                ),
                child: FutureBuilder(
                    future: prayerProvider.getPrayerData(
                        city: locationProvider.city,
                        country: locationProvider.country),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading...",
                            style: textStyleNormal(color: fontColorLight));
                      }
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data!.data.date.hijri.year,
                              style: textStyleLarge(color: fontColorLight),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              snapshot.data!.data.date.hijri.month.en,
                              style: textStyleLarge(color: fontColorLight),
                            ),
                            Column(
                              children: [
                                Text(
                                  snapshot.data!.data.date.hijri.day,
                                  style: textStyleLarge(color: fontColorLight),
                                ),
                                Text(
                                  snapshot.data!.data.date.hijri.weekday.en,
                                  style: textStyleSmall(color: fontColorLight),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TableCalendar(
            focusedDay: today,
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2030),
          ),
        ],
      ),
    );
  }
}
