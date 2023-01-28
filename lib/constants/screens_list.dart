import 'package:flutter/material.dart';
import 'package:salam_india/features/home/screens/calendar_screen.dart';
import 'package:salam_india/features/home/screens/home_screen.dart';
import 'package:salam_india/features/home/screens/news_screen.dart';
import 'package:salam_india/features/home/screens/profile_screen.dart';
import 'package:salam_india/features/home/screens/tool_screen.dart';

class ScreenList {
  static List<Widget> screenList = [
    const HomeScreen(),
    const NewsScreen(),
    const ToolScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
  ];
}
