import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            //backwardsCompatibility: false,
            titleTextStyle: TextStyle(
                color: Color(0xff222222),
                fontSize: 18,
                fontWeight: FontWeight.w500),
            elevation: 0),
      );
}
