import "dart:async";
import 'package:chopper_json_serializable/core/exceptions.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class MockHttpClientBuilder {
  MockClient generateClient() {
    return MockClient(
      (request) async {
        try {
          final response = await _getResponseByPath(request.url.path);
          return http.Response(response, 200);
        } on PathNotFoundException catch (e) {
          return http.Response(e.message, 404);
        } catch (e) {
          return http.Response('Server Error', 500);
        }
      },
    );
  }

  Future<String> _getResponseByPath(String path) async {
    final subPath = path.substring('myBaseUrl'.length + 1);
    switch (subPath) {
      case 'articles':
        return await _readResponseFromAsset(
            'assets/rest/article/get_articles.json');
      case 'articles/1':
        return await _readResponseFromAsset(
            'assets/rest/article/get_articles.json');
      case 'people/1':
        return await _readResponseFromAsset(
            'assets/rest/people/get_people.json');
      default:
        throw PathNotFoundException(path);
    }
  }

  Future<String> _readResponseFromAsset(String assetPath) async =>
      rootBundle.loadString(assetPath);
}
