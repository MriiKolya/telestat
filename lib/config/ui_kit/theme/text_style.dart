import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle body = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.47,
  );
  static const TextStyle subheadLine = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
}
