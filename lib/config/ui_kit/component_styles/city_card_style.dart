import 'package:flutter/material.dart';

import 'package:telestat/config/ui_kit/theme/text_style.dart';

abstract class _Constants {
  static const double chatCardBorderRadius = 20;
  static const double paddimnDescription = 10;
  static const double paddingV = 4;
  static const double paddingH = 8;
}

class CityCardStyle extends ThemeExtension<CityCardStyle> {
  final Color borderColor;
  final BorderRadius cityCardRadius;
  final TextStyle nameStyle;
  final TextStyle descriptionStyle;
  final EdgeInsets amountPadding;
  final EdgeInsets textOverflowPadding;

  CityCardStyle({
    required this.cityCardRadius,
    required this.nameStyle,
    required this.descriptionStyle,
    required this.borderColor,
    required this.amountPadding,
    required this.textOverflowPadding,
  });

  factory CityCardStyle.light() => CityCardStyle(
        cityCardRadius: BorderRadius.circular(_Constants.chatCardBorderRadius),
        amountPadding: const EdgeInsets.symmetric(
            vertical: _Constants.paddingV, horizontal: _Constants.paddingH),
        textOverflowPadding:
            const EdgeInsets.symmetric(vertical: _Constants.paddimnDescription),
        nameStyle: AppTextStyle.title.copyWith(color: Colors.black),
        descriptionStyle: AppTextStyle.subheadLine.copyWith(color: Colors.black),
        borderColor: Colors.grey.shade300,
      );

  @override
  CityCardStyle lerp(
    covariant CityCardStyle? other,
    double t,
  ) {
    return this;
  }

  @override
  CityCardStyle copyWith({
    Color? borderColor,
    BorderRadius? cityCardRadius,
    TextStyle? nameStyle,
    TextStyle? descriptionStyle,
    EdgeInsets? amountPadding,
    EdgeInsets? textOverflowPadding,
  }) {
    return CityCardStyle(
      borderColor: borderColor ?? this.borderColor,
      cityCardRadius: cityCardRadius ?? this.cityCardRadius,
      nameStyle: nameStyle ?? this.nameStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      amountPadding: amountPadding ?? this.amountPadding,
      textOverflowPadding: textOverflowPadding ?? this.textOverflowPadding,
    );
  }
}
