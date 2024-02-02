part of 'list_city_cubit.dart';

enum ListCityStatus { loading, success, error, initial }

class ListCityState {
  final ListCityStatus status;
  final Object? error;
  final List<CityModel> listCity;

  const ListCityState(
      {required this.status, this.error, required this.listCity});

  factory ListCityState.initial() => const ListCityState(
        status: ListCityStatus.initial,
        listCity: [],
      );
  ListCityState copyWith({
    ListCityStatus? status,
    Object? error,
    List<CityModel>? listCity,
  }) {
    return ListCityState(
      status: status ?? this.status,
      error: error ?? this.error,
      listCity: listCity ?? this.listCity,
    );
  }
}
