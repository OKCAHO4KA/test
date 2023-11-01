import 'package:flutter/material.dart';

class AppTheme {
  static const Color orange = Color(0xffEA560D);
  static const Color black = Color(0xff172027);
  static const Color gray = Color(0xffA9B5C1);
  static const Color grayDark = Color(0xff677482);
  static const Color gray2 = Color(0xff919EAB);
  static const Color gray5 = Color(0xffE7ECF0);

  ThemeData getTheme() => ThemeData(
      iconTheme: const IconThemeData(size: 25, color: grayDark),
      scaffoldBackgroundColor: const Color(0xfffbfbfb),
      // scaffoldBackgroundColor: Colors.red,
      useMaterial3: true,
      colorSchemeSeed: Colors.white,
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: black),
          titleMedium: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: black),
          titleSmall: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: black),
          bodySmall: TextStyle(
              fontFamily: 'SFPro', fontWeight: FontWeight.w400, fontSize: 16)));
}
