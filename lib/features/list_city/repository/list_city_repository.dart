import 'package:telestat/features/list_city/model/city_model.dart';
import 'package:telestat/features/list_city/repository/list_city_interface.dart';
import 'package:telestat/service/list_city_service.dart';

class CityListRepository implements ICityListRepository {
  final ListCityService _service = ListCityService();

  @override
  Future<List<CityModel>> loadCities() => _service.getList();

  @override
  void addCity({
    required List<CityModel> listCity,
    required CityModel city,
  }) {
    listCity.add(city);
    _service.addItem(city);
  }

  @override
  void editCity({
    required List<CityModel> listCity,
    required CityModel editedCity,
    required int index,
  }) {
    if (index != -1) {
      listCity[index] = editedCity;
    } else {
      throw Exception('Місто не знайдено в списку.');
    }
    _service.updateCity(editedCity, index);
  }

  @override
  void removeCity({required List<CityModel> listCity, required int index}) {
    listCity.removeAt(index);
    _service.deleteCity(index);
  }
}
