import 'package:flutter/material.dart';
import 'package:telestat/config/ui_kit/theme/theme_context_extention.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.index,
    this.labelText,
    this.controller,
    this.onChange,
    this.keyboardType,
    this.validator,
  });

  final int? index;
  final String? labelText;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final style = context.textFieldStyle;
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      onChanged: (value) {
        onChange?.call(value);
      },
      decoration: InputDecoration(
        errorStyle: style.errorTextStyle,
        labelText: labelText,
        border: style.border,
        constraints: style.constraints,
        errorBorder: style.errorBorder,
        enabledBorder: style.enabledBorder,
        focusedBorder: style.focusedBorder,
        disabledBorder: style.disabledBorder,
        contentPadding: style.contentPadding,
        floatingLabelStyle: style.floatingLabelStyle,
        labelStyle: style.labelStyle,
      ),
      style: style.textStyle,
    );
  }
}
