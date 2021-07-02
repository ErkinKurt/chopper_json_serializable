import 'package:chopper_json_serializable/models/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people.g.dart';

@JsonSerializable()
class People extends Entity {
  final String name;
  final int age;
  final String gender;

  People(
    String type,
    String id, {
    required this.name,
    required this.age,
    required this.gender,
  }) : super(type, id);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);

  static const fromJsonFactory = _$PeopleFromJson;
}
