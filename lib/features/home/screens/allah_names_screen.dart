import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';
import 'package:salam_india/provider/allah_name_provider.dart';
import 'package:salam_india/widgets/custom_card.dart';

class AllahNamesScreen extends StatefulWidget {
  const AllahNamesScreen({super.key});

  @override
  State<AllahNamesScreen> createState() => _AllahNamesScreenState();
}

class _AllahNamesScreenState extends State<AllahNamesScreen> {
  @override
  void initState() {
    final allahNameProvider = context.read<AllahNameProvider>();
    super.initState();
    allahNameProvider.getAllahName();
  }

  @override
  Widget build(BuildContext context) {
    final allahNameProvider = context.read<AllahNameProvider>();
    return Scaffold(
      body: FutureBuilder(
          future: allahNameProvider.getAllahName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  title: Text(
                    "99 Names Of Allah",
                    style: textStyleMedium(color: fontColorDark),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CustomCard(
                      cardHeight: 125,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Text(
                            snapshot.data!.data[index].number.toString(),
                            style: textStyleNormal(),
                          ),
                          title: Text(
                            snapshot.data!.data[index].transliteration
                                .toString(),
                            style: textStyleNormal(),
                          ),
                          subtitle: Text(
                            snapshot.data!.data[index].en.meaning.toString(),
                            style: textStyleExtraSmall(
                                color: fontColorLight.withOpacity(0.5)),
                          ),
                          trailing: Text(
                            snapshot.data!.data[index].name.toString(),
                            style: textStyleSmall(),
                          ),
                        ),
                      ),
                    );
                  }, childCount: snapshot.data!.data.length),
                ),
              ],
            );
          }),
    );
  }
}
