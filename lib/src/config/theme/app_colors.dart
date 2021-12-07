import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor purple =
      MaterialColor(_purplePrimaryValue, <int, Color>{
    50: Color(0xFFF3E5F5),
    100: Color(0xFFE1BEE7),
    200: Color(0xFFCE93D8),
    300: Color(0xFFBA68C8),
    400: Color(0xFFAB47BC),
    500: Color(_purplePrimaryValue),
    600: Color(0xFF8E24AA),
    700: Color(0xFF7B1FA2),
    800: Color(0xFF6A1B9A),
    900: Color(0xFF4A148C),
  });

  static const int _purplePrimaryValue = 0xFF9C27B0;
  static const Color white = Color(0xFFffffff);
  static const Color lightBlack = Color(0xFF212121);
  static const Color gray = Color(0xFF757575);
  static const Color lightGray = Color(0xFFEFEFEF);
}
