import 'package:flutter/material.dart';
import 'package:telestat/config/ui_kit/theme/theme_context_extention.dart';
import 'package:telestat/features/list_city/model/city_model.dart';

class CityCard extends StatelessWidget {
  final CityModel city;
  final void Function()? tapEditCity;
  final void Function()? tapDeleteCity;

  const CityCard({
    Key? key,
    required this.city,
    this.tapEditCity,
    this.tapDeleteCity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = context.cityCardStyle;
    return Container(
      padding: style.amountPadding,
      decoration: BoxDecoration(
        borderRadius: style.cityCardRadius,
        color: style.borderColor,
      ),
      child: ListTile(
        title: Text(
          city.name,
          style: style.nameStyle,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: style.textOverflowPadding,
          child: Text(
            city.description,
            style: style.descriptionStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: tapEditCity,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: tapDeleteCity,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
