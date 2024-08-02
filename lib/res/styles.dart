import 'package:flutter/material.dart';

import 'fonts.dart';

TextStyle _textStyle({
  required double fontSize,
  required String fontFamily,
  required FontWeight fontWeight,
  required Color color,
  required TextDecoration? decoration,
  Color? decorationColor,
}) => TextStyle(
  fontSize: fontSize,
  fontFamily: fontFamily,
  fontWeight: fontWeight,
  color: color,
  decoration: decoration,
  decorationColor: decorationColor,
);


TextStyle thinTextStyle({
  required double fontSize,
  required Color color,
  String fontFamily = Fonts.roboto,
  TextDecoration? decoration,
  Color? decorationColor,
}) => _textStyle(
  fontSize: fontSize,
  fontFamily: fontFamily,
  fontWeight:
  FontWeightManager.thin,
  color: color,
  decoration: decoration,
  decorationColor: decorationColor,
);


TextStyle lightTextStyle({
  required double fontSize,
  required Color color,
  String fontFamily = Fonts.roboto,
  TextDecoration? decoration,
  Color? decorationColor,
}) => _textStyle(
  fontSize: fontSize,
  fontFamily: fontFamily,
  fontWeight: FontWeightManager.light,
  color: color,
  decoration: decoration,
  decorationColor: decorationColor,
);


TextStyle regularTextStyle({
  required double fontSize,
  required Color color,
  String fontFamily = Fonts.roboto,
  TextDecoration? decoration,
  Color? decorationColor,
}) => _textStyle(
  fontSize: fontSize,
  fontFamily: fontFamily,
  fontWeight: FontWeightManager.regular,
  color: color,
  decoration: decoration,
  decorationColor: decorationColor,
);


TextStyle mediumTextStyle({
  required double fontSize,
  required Color color,
  String fontFamily = Fonts.roboto,
  TextDecoration? decoration,
  Color? decorationColor,
}) => _textStyle(
  fontSize: fontSize,
  fontFamily: fontFamily,
  fontWeight: FontWeightManager.medium,
  color: color,
  decoration: decoration,
  decorationColor: decorationColor,
);


TextStyle boldTextStyle({
  required double fontSize,
  required Color color,
  String fontFamily = Fonts.roboto,
  TextDecoration? decoration,
  Color? decorationColor,
}) => _textStyle(
  fontSize: fontSize,
  fontFamily: fontFamily,
  fontWeight: FontWeightManager.bold,
  color: color,
  decoration: decoration,
  decorationColor: decorationColor,
);


TextStyle blackTextStyle({
  required double fontSize,
  required Color color,
  String fontFamily = Fonts.roboto,
  TextDecoration? decoration,
  Color? decorationColor,
}) => _textStyle(
  fontSize: fontSize,
  fontFamily: fontFamily,
  fontWeight: FontWeightManager.black,
  color: color,
  decoration: decoration,
  decorationColor: decorationColor,
);
