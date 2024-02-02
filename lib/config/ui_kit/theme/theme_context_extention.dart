import 'package:flutter/material.dart';
import 'package:telestat/config/ui_kit/component_styles/component_styles.dart';

extension ThemeContextExtention on BuildContext {
  CityCardStyle get cityCardStyle => Theme.of(this).extension<CityCardStyle>()!;

  AppTextFieldStyle get textFieldStyle =>
      Theme.of(this).extension<AppTextFieldStyle>()!;
}
