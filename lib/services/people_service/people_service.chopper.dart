// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PeopleService extends PeopleService {
  _$PeopleService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PeopleService;

  @override
  Future<Response<dynamic>> getPerson(String personId) {
    final $url = '/people/$personId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
