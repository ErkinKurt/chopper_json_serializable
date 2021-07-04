import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

class ChopperClientBuilder {
  static ChopperClient buildChopperClient(List<ChopperService> services,
          [http.BaseClient? httpClient]) =>
      ChopperClient(
        client: httpClient,
        baseUrl: 'myBaseUrl',
        services: services,
      );
}
