import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:telestat/config/ui_kit/theme/theme.dart';
import 'package:telestat/features/list_city/cubit/list_city_cubit.dart';
import 'package:telestat/features/list_city/list_city.dart';
import 'package:telestat/features/list_city/model/city_model.dart';
import 'package:telestat/features/list_city/repository/list_city_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:telestat/generated/l10n.dart';

import 'config/locale/cubit/localization_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CityModelAdapter());
  runApp(const ListApp());
}

class ListApp extends StatelessWidget {
  const ListApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListCityCubit>(
          create: (_) =>
              ListCityCubit(repository: CityListRepository())..loadCities(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit(),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: state.locale,
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            theme: lightTheme,
            home: const ListCity(),
          );
        },
      ),
    );
  }
}
