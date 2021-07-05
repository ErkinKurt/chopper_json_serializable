// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseError _$ResponseErrorFromJson(Map<String, dynamic> json) {
  return ResponseError(
    errorStatus: json['errorStatus'] as String,
  );
}

Map<String, dynamic> _$ResponseErrorToJson(ResponseError instance) =>
    <String, dynamic>{
      'errorStatus': instance.errorStatus,
    };
