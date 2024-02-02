import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telestat/config/ui_kit/component/alert_city.dart';
import 'package:telestat/config/ui_kit/component/city_card.dart';
import 'package:telestat/features/list_city/cubit/list_city_cubit.dart';
import 'package:telestat/features/list_city/model/city_model.dart';
import 'package:telestat/generated/l10n.dart';

class AnimatedListCity extends StatefulWidget {
  const AnimatedListCity({super.key, required this.listCity});

  final List<CityModel> listCity;

  @override
  State<AnimatedListCity> createState() => _AnimatedListCityState();
}

class _AnimatedListCityState extends State<AnimatedListCity> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertCity(
              title: S.of(context).addChat,
              onPressed: (city) => addItem(context, city),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
          initialItemCount: widget.listCity.length,
          key: _key,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CityCard(
                      city: widget.listCity[index],
                      tapDeleteCity: () {
                        removeItem(context, index);
                      },
                      tapEditCity: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertCity(
                            title: S.of(context).addChat,
                            onPressed: (editedCity) => context
                                .read<ListCityCubit>()
                                .editCity(editedCity: editedCity, index: index),
                          ),
                        );
                      }),
                ),
              ),
            );
          }),
    );
  }

  void removeItem(BuildContext context, int index) {
    context.read<ListCityCubit>().removeCity(index: index);
    AnimatedList.of(context).removeItem(index, (context, animation) {
      return FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: CityCard(
            city: CityModel.empty(),
            tapEditCity: () => showDialog(
              context: context,
              builder: (_) => AlertCity(
                title: S.of(context).editChat,
              ),
            ),
          ),
        ),
      );
    });
  }

  void addItem(BuildContext context, CityModel city) {
    context.read<ListCityCubit>().addCity(city: city);
    _key.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 250));
  }
}
