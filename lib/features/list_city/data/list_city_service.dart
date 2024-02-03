import 'package:hive/hive.dart';
import 'package:telestat/features/list_city/model/city_model.dart';

class ListCityService {
  final String _boxName = 'list_city_box';

  Future<Box<CityModel>> get _box async =>
      await Hive.openBox<CityModel>(_boxName);

  Future<void> addItem(CityModel city) async {
    var box = await _box;
    await box.add(city);
  }

  Future<List<CityModel>> getList() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteCity(int index) async {
    var box = await _box;
    box.deleteAt(index);
  }

  Future<void> updateCity(CityModel city, int index) async {
    var box = await _box;
    await box.putAt(index, city);
  }
}
