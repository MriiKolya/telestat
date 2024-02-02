import 'package:flutter/material.dart';

import 'package:telestat/config/ui_kit/theme/text_style.dart';

abstract class _Constants {
  static const double contentPaddingV = 8;
  static const double contentPaddingH = 16;
  static const double amountBorderRadius = 16;
  static const BoxConstraints constraints = BoxConstraints.expand(height: 60);
}

class AppTextFieldStyle extends ThemeExtension<AppTextFieldStyle> {
  final TextStyle labelStyle;
  final BoxConstraints constraints;
  final TextStyle floatingLabelStyle;
  final TextStyle textStyle;
  final TextStyle errorTextStyle;
  final EdgeInsets contentPadding;
  final OutlineInputBorder border;
  final OutlineInputBorder errorBorder;
  final OutlineInputBorder enabledBorder;
  final OutlineInputBorder focusedBorder;
  final OutlineInputBorder disabledBorder;

  AppTextFieldStyle({
    required this.constraints,
    required this.border,
    required this.errorBorder,
    required this.enabledBorder,
    required this.focusedBorder,
    required this.disabledBorder,
    required this.errorTextStyle,
    required this.labelStyle,
    required this.floatingLabelStyle,
    required this.textStyle,
    required this.contentPadding,
  });

  factory AppTextFieldStyle.light() => AppTextFieldStyle(
        labelStyle:
            AppTextStyle.subheadLine.copyWith(color: Colors.grey.shade800),
        floatingLabelStyle: AppTextStyle.caption,
        textStyle: const TextStyle(),
        contentPadding: const EdgeInsets.symmetric(
            vertical: _Constants.contentPaddingV,
            horizontal: _Constants.contentPaddingH),
        errorTextStyle: AppTextStyle.caption.copyWith(color: Colors.red),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
                Radius.circular(_Constants.amountBorderRadius)),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(_Constants.amountBorderRadius)),
            borderSide: BorderSide(color: Colors.red)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
                Radius.circular(_Constants.amountBorderRadius)),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(_Constants.amountBorderRadius)),
            borderSide: BorderSide(color: Colors.blue)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        constraints: _Constants.constraints,
      );

  @override
  AppTextFieldStyle lerp(
    covariant AppTextFieldStyle? other,
    double t,
  ) {
    return this;
  }

  @override
  AppTextFieldStyle copyWith({
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    TextStyle? textStyle,
    TextStyle? errorTextStyle,
    EdgeInsets? contentPadding,
    BoxConstraints? constraints,
    OutlineInputBorder? border,
    OutlineInputBorder? errorBorder,
    OutlineInputBorder? enabledBorder,
    OutlineInputBorder? focusedBorder,
    OutlineInputBorder? disabledBorder,
  }) {
    return AppTextFieldStyle(
      labelStyle: labelStyle ?? this.labelStyle,
      floatingLabelStyle: floatingLabelStyle ?? this.floatingLabelStyle,
      textStyle: textStyle ?? this.textStyle,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      contentPadding: contentPadding ?? this.contentPadding,
      border: border ?? this.border,
      errorBorder: errorBorder ?? this.errorBorder,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      constraints: constraints ?? this.constraints,
    );
  }
}
