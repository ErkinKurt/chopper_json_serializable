// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['type'] as String,
    json['id'] as String,
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
