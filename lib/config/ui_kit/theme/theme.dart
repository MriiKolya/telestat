import 'package:flutter/material.dart';
import 'package:telestat/config/ui_kit/component_styles/app_text_field_style.dart';
import 'package:telestat/config/ui_kit/component_styles/city_card_style.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  extensions: <ThemeExtension<dynamic>>[
    AppTextFieldStyle.light(),
    CityCardStyle.light(),
  ],
);
