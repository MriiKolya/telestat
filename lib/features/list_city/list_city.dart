import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telestat/config/locale/cubit/localization_cubit.dart';
import 'package:telestat/features/list_city/cubit/list_city_cubit.dart';
import 'package:telestat/features/list_city/widget/animated_list_city.dart';
import 'package:telestat/generated/l10n.dart';

class ListCity extends StatelessWidget {
  const ListCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).list),
        leading: IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            context.read<LocalizationCubit>().changeLocale();
          },
        ),
      ),
      body: BlocBuilder<ListCityCubit, ListCityState>(
        builder: (context, state) {
          if (state.status == ListCityStatus.success) {
            return AnimatedListCity(
              listCity: state.listCity,
            );
          } else if (state.status == ListCityStatus.loading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == ListCityStatus.error) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
