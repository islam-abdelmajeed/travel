import 'package:flutter/material.dart';
import 'package:travel_agency_app/constants/constant.dart';

ThemeData themeData = ThemeData(
  primaryColor: defaultColor,
  scaffoldBackgroundColor: whiteColor,
  colorScheme: const ColorScheme.light().copyWith(primary: defaultColor),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: defaultColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 36.0,
      fontWeight: FontWeight.w700,
      color: whiteColor,
    ),
    titleMedium: TextStyle(
      color: blackColor,
      fontFamily: 'Cairo',
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
      color: lightGreyColor,
      fontSize: 14.0,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      color: blackColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: blackColor,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: blackColor,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xffFAFBFC),
    selectedItemColor: defaultColor,
    unselectedItemColor: lightGreyColor,
    elevation: 15.0,
  ),
);
