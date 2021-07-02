// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) {
  return People(
    json['type'] as String,
    json['id'] as String,
    name: json['name'] as String,
    age: json['age'] as int,
    gender: json['gender'] as String,
  );
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
    };
