import 'package:chopper_json_serializable/models/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Entity {
  final String title;
  final String body;

  Article(
    String type,
    String id, {
    required this.title,
    required this.body,
  }) : super(type, id);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  static const fromJsonFactory = _$ArticleFromJson;
}
