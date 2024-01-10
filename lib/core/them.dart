// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeApp {
  static ThemeData themeapp = ThemeData(
    scaffoldBackgroundColor: const Color(0xffFFFFFF),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xffF2F2F2),
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
}
