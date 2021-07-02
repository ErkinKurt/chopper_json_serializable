import "dart:async";
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class NotFoundException implements Exception {
  final String message;
  NotFoundException([this.message = '']);
}

class MockHttpClientBuilder {
  MockClient generateClient() {
    return MockClient(
      (request) async {
        try {
          final response = await _getResponseByPath(request.url.path);
          return http.Response(response, 200);
        } on NotFoundException catch (e) {
          return http.Response(e.message, 404);
        } catch (e) {
          return http.Response('Server Error', 500);
        }
      },
    );
  }

  Future<String> _getResponseByPath(String path) async {
    switch (path) {
      case 'articles':
        return await _readResponseFromAsset('assets/rest/article/get_articles.json');
      case 'article':
        return await _readResponseFromAsset('assets/rest/article/get_articles.json');
      case 'people':
        return await _readResponseFromAsset('assets/rest/people/get_people.json');
      default:
        throw NotFoundException(path);
    }
  }

  Future<String> _readResponseFromAsset(String assetPath) async {
    return rootBundle.loadString(assetPath);
  }
}
