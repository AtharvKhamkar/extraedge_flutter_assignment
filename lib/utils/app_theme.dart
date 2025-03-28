import 'package:extraedge_spacex/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static TextTheme customTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 38.0,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    displayMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: white,
    ),
    displaySmall: TextStyle(
      fontSize: 27.0,
      fontWeight: FontWeight.w500,
      color: white,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      color: white,
    ),
    titleMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: white,
    ),
    titleSmall: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      color: white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: medGrey,
    ),
    bodyMedium:
        TextStyle(color: medGrey, fontSize: 15.0, fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: medGrey,
    ),
  );
}
