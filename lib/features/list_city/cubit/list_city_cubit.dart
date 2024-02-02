import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telestat/features/list_city/model/city_model.dart';
import 'package:telestat/features/list_city/repository/list_city_repository.dart';

part 'list_city_state.dart';

class ListCityCubit extends Cubit<ListCityState> {
  final CityListRepository _repository;

  ListCityCubit({
    required CityListRepository repository,
  })  : _repository = repository,
        super(ListCityState.initial());

  Future<void> loadCities() async {
    try {
      emit(state.copyWith(status: ListCityStatus.loading));
      final list = await _repository.loadCities();
      emit(
        state.copyWith(status: ListCityStatus.success, listCity: list),
      );
    } catch (e) {
      emit(state.copyWith(status: ListCityStatus.error, error: e));
      debugPrint(e.toString());
    }
  }

  addCity({required CityModel city}) {
    try {
      emit(state.copyWith(status: ListCityStatus.loading));
      _repository.addCity(city: city, listCity: state.listCity);
      emit(state.copyWith(
          status: ListCityStatus.success, listCity: state.listCity));
    } catch (e) {
      emit(state.copyWith(status: ListCityStatus.error, error: e));
      debugPrint(e.toString());
    }
  }

  removeCity({required int index}) {
    try {
      emit(state.copyWith(status: ListCityStatus.loading));
      _repository.removeCity(
        listCity: state.listCity,
        index: index,
      );
      emit(state.copyWith(
          status: ListCityStatus.success, listCity: state.listCity));
    } catch (e) {
      emit(state.copyWith(status: ListCityStatus.error, error: e));
      debugPrint(e.toString());
    }
  }

  editCity({
    required CityModel editedCity,
    required int index,
  }) {
    try {
      emit(state.copyWith(status: ListCityStatus.loading));
      _repository.editCity(
        listCity: state.listCity,
        editedCity: editedCity,
        index: index,
      );
      emit(state.copyWith(status: ListCityStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ListCityStatus.error, error: e));
      debugPrint(e.toString());
    }
  }
}
