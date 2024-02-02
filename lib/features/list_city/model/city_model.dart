import 'package:hive/hive.dart';

part 'city_model.g.dart';

@HiveType(typeId: 1)
class CityModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;

  const CityModel({
    required this.name,
    required this.description,
  });

  factory CityModel.empty() => const CityModel(name: '', description: '');

  Map<String, dynamic> toJson() => {
        'value': name,
        'description': description,
      };

  CityModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'];

  @override
  String toString() => '\n CityModel(name: $name, description: $description)';
}
