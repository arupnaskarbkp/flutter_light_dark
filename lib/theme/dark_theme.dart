import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/color_resources.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Roboto',
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  primaryColor: const Color(0xFF689da7),
  brightness: Brightness.dark,
  secondaryHeaderColor: const Color(0xFFaaa818),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.black, selectedItemColor: ColorResources.themeDarkBackgroundColor),
);
