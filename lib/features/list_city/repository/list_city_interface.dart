import 'package:telestat/features/list_city/model/city_model.dart';

abstract interface class ICityListRepository {
  Future<List<CityModel>> loadCities();
  void removeCity({required List<CityModel> listCity, required int index});
  void addCity({required List<CityModel> listCity, required CityModel city});
  void editCity({
    required List<CityModel> listCity,
    required CityModel editedCity,
    required int index,
  });
}
