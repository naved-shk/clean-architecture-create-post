import 'package:flutter/material.dart';
import 'package:posting_system/src/config/theme/app_colors.dart';
import 'package:posting_system/src/core/utils/constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColor.purple),
      scaffoldBackgroundColor: AppColor.lightGray,
      textTheme: _textTheme(),
      cardTheme: const CardTheme(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(generalPadding16),
          textStyle: const TextStyle(fontSize: buttonTextSize16),
        ),
      ),
    );
  }

  static TextTheme _textTheme() {
    return const TextTheme(
        headline5: TextStyle(color: AppColor.lightBlack),
        bodyText1: TextStyle(color: AppColor.lightBlack),
        bodyText2: TextStyle(color: AppColor.gray),
        caption: TextStyle(color: AppColor.purple));
  }
}
