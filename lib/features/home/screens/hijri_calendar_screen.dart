import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';
import 'package:salam_india/provider/hijri_month_provider.dart';
import 'package:salam_india/provider/prayer_provider.dart';
import 'package:salam_india/widgets/custom_card.dart';

class HijriCalendarScreen extends StatelessWidget {
  const HijriCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.read<PrayerProvider>();
    final hijriMonthCalendar = context.read<HijriMonthProvider>();
    return Scaffold(
      body: FutureBuilder(
          future: hijriMonthCalendar.getHijriMonth(
              month: prayerProvider.month, year: prayerProvider.year),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  title: Text(
                    "Hijri Calendar",
                    style: textStyleLarge(
                      color: fontColorDark,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => CustomCard(
                            cardHeight: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          snapshot
                                              .data!.data[index].gregorian.day,
                                          style: textStyleSmall(),
                                        ),
                                        Text(
                                          snapshot.data!.data[index].gregorian
                                              .month.en.name,
                                          style: textStyleExtraSmall(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          snapshot.data!.data[index].hijri.day,
                                          style: textStyleNormal(),
                                        ),
                                        Text(
                                          snapshot.data!.data[index].hijri
                                              .weekday.en,
                                          style: textStyleSmall(),
                                        ),
                                        Text(
                                          snapshot.data!.data[index].hijri.month
                                              .en.name,
                                          style: textStyleExtraSmall(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.data[index].hijri.year,
                                        style: textStyleSmall(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // child: ListTile(
                            //   leading: Column(
                            //     children: [
                            //       Text(
                            //         snapshot.data!.data[index].gregorian.day,
                            //         style: textStyleSmall(),
                            //       ),
                            //       Text(
                            //         snapshot.data!.data[index].gregorian.month
                            //             .en.name,
                            //         style: textStyleExtraSmall(),
                            //       ),
                            //     ],
                            //   ),
                            //   title: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Text(
                            //         snapshot.data!.data[index].hijri.day,
                            //         style: textStyleNormal(),
                            //       ),
                            //       Text(
                            //         snapshot.data!.data[index].hijri.weekday.en,
                            //         style: textStyleSmall(),
                            //       ),
                            //       Text(
                            //         snapshot
                            //             .data!.data[index].hijri.month.en.name,
                            //         style: textStyleSmall(),
                            //       ),
                            //     ],
                            //   ),
                            //   trailing: Text(
                            //     snapshot.data!.data[index].hijri.year,
                            //     style: textStyleSmall(),
                            //   ),
                            // ),
                          ),
                      childCount: snapshot.data?.data.length),
                ),
              ],
            );
          }),
    );
  }
}
