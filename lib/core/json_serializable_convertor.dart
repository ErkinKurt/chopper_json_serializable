import 'package:chopper/chopper.dart';
import 'package:chopper_json_serializable/core/json_type_parser.dart';
import 'package:chopper_json_serializable/models/error/response_error.dart';
import 'package:japx/japx.dart';

class JsonSerializableConverter extends JsonConverter {
  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    final jsonRes = super.convertResponse(response);
    final flatJson = Japx.decode(jsonRes.body);
    return jsonRes.copyWith<ResultType>(
        body: JsonTypeParser.decode<Item>(flatJson['data']));
  }

  @override
  // We won't be dealing with toJson methods for now...
  Request convertRequest(Request request) => super.convertRequest(request);

  @override
  Response convertError<BodyType, InnerType>(Response response) {
    final jsonRes = super.convertError(response);
    final responseError = JsonTypeParser.decode<ResponseError>(jsonRes.body);
    return jsonRes.copyWith(bodyError: responseError);
  }
}
