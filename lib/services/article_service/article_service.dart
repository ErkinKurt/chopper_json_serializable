import 'package:chopper/chopper.dart';

part 'article_service.chopper.dart';

@ChopperApi(baseUrl: "/articles")
abstract class ArticleService extends ChopperService {
  static ArticleService create([ChopperClient? client]) =>
      _$ArticleService(client);

  @Get(path: "/{article_id}")
  Future<Response> getArticle(
    @Path('article_id') String articleId,
  );
}
