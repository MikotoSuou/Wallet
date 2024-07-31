import 'package:flutter/material.dart';
import 'package:wallet/res/styles.dart';
import 'colors.dart';
import 'fonts.dart';
import 'values.dart' as values;

ThemeData get applicationTheme => ThemeData(
  primaryColor: ColorManager.primary,
  primaryColorLight: ColorManager.primary,
  primaryColorDark: ColorManager.primary,
  disabledColor: ColorManager.darkGray,
  scaffoldBackgroundColor: ColorManager.background,
  textTheme: _textTheme,
  cardTheme: _cardTheme,
);

/// text theme
TextTheme get _textTheme => TextTheme(
  /// Use for error / hint
  displaySmall: regularTextStyle(color: ColorManager.darkGray, fontSize: FontSize.s14),

  headlineMedium: boldTextStyle(color: ColorManager.black, fontSize: FontSize.s16),

  /// Use for titles
  titleLarge: boldTextStyle(color: ColorManager.black, fontSize: FontSize.s20),
  titleMedium: regularTextStyle(color: ColorManager.darkGray, fontSize: FontSize.s14),

  /// Use for button text
  labelMedium: boldTextStyle(color: ColorManager.primary, fontSize: FontSize.s16),

  /// Use in long messages / text
  bodyMedium: regularTextStyle(color: ColorManager.black, fontSize: FontSize.s14),
  bodySmall: regularTextStyle(color: ColorManager.black, fontSize: FontSize.s12),
);

CardTheme get _cardTheme => CardTheme(
  color: ColorManager.white,
  surfaceTintColor: ColorManager.white,
  elevation: 0.5,
  margin: EdgeInsets.zero,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(values.Size.s16)),
);