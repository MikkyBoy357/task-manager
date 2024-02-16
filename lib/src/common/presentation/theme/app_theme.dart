import 'package:flutter/material.dart';

import '../../common.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  fontFamily: 'Noto Sans',
  primaryColor: lightPrimary,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: lightAccent,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: lightBG,
  appBarTheme: AppBarTheme(
    backgroundColor: lightPrimary.withOpacity(0.7),
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Noto Sans',
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightPrimary.withOpacity(0.7),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(darkAccent),
    overlayColor: MaterialStateProperty.all(darkAccent),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Noto Sans',
  brightness: Brightness.dark,
  primaryColor: darkPrimary,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: darkAccent,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: darkBG,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBG,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Noto Sans',
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkPrimary,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: darkPrimary,
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(darkAccent),
    overlayColor: MaterialStateProperty.all(darkAccent),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
);

Color profileCardShadowColor = Colors.grey[200]!;

BoxShadow cardShadow = BoxShadow(
  color: greenAccent.withOpacity(0.1),
  blurRadius: 8.0,
  offset: const Offset(0.0, 2.0),
);
