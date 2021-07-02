import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class MockHttpClientBuilder {
  MockClient generateClient() {
    return MockClient(
      (request) async {
        final response = await _getResponseByPath(request.url.path);
        return http.Response(response, 200);
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
        return 'Not Found!';
    }
  }

  Future<String> _readResponseFromAsset(String assetPath) async {
    return rootBundle.loadString(assetPath);
  }
}
