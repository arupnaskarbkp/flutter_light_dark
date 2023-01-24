import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/color_resources.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Rubik',
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  primaryColor: const Color(0xFF003E47),
  secondaryHeaderColor: const Color(0xFFCFEC7E),
  highlightColor: const Color(0xFF003E47),
  backgroundColor: Colors.white,
  primaryColorDark: Colors.black,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white,selectedItemColor: ColorResources.themeLightBackgroundColor),

);