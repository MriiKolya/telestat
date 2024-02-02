import 'package:flutter/material.dart';
import 'package:telestat/config/ui_kit/component/app_text_field.dart';
import 'package:telestat/config/ui_kit/theme/text_style.dart';
import 'package:telestat/features/list_city/model/city_model.dart';
import 'package:telestat/generated/l10n.dart';

class AlertCity extends StatelessWidget {
  AlertCity({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function(CityModel city)? onPressed;
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyle.body,
        textAlign: TextAlign.center,
      ),
      actions: [
        Form(
          key: formKey,
          child: Column(
            children: [
              AppTextField(
                controller: _nameController,
                labelText: S.of(context).name,
                validator: (input) {
                  return validation(input, context);
                },
              ),
              AppTextField(
                controller: _descriptionController,
                labelText: S.of(context).description,
                validator: (input) {
                  return validation(input, context);
                },
              ),
              SizedBox(
                height: 25,
                child: FilledButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pop();

                      onPressed?.call(CityModel(
                        name: _nameController.text.trim(),
                        description: _descriptionController.text.trim(),
                      ));
                    } else {
                      return;
                    }
                  },
                  child: Text(S.of(context).add),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String? validation(String? input, BuildContext context) {
    if (input != '' && input != null) {
      return null;
    } else {
      return S.of(context).empty_field;
    }
  }
}
