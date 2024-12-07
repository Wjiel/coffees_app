import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFE9E9E9),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0,
    selectedLabelStyle: TextStyle(fontSize: 0),
    unselectedLabelStyle: TextStyle(fontSize: 0),
    backgroundColor: Colors.transparent,
  ),
);
