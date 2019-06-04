// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorFirebaseModel _$ErrorFirebaseModelFromJson(Map<String, dynamic> json) {
  return ErrorFirebaseModel(
      error: json['error'] == null
          ? null
          : _ErrorModelChild.fromJson(json['error'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ErrorFirebaseModelToJson(ErrorFirebaseModel instance) =>
    <String, dynamic>{'error': instance.error};

_ErrorModelChild _$_ErrorModelChildFromJson(Map<String, dynamic> json) {
  return _ErrorModelChild(
      code: json['code'] as int,
      message: json['message'] as String,
      errors: (json['errors'] as List)
          ?.map((e) => e == null
              ? null
              : _ErrorsModelChild.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$_ErrorModelChildToJson(_ErrorModelChild instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'errors': instance.errors
    };

_ErrorsModelChild _$_ErrorsModelChildFromJson(Map<String, dynamic> json) {
  return _ErrorsModelChild(
      message: json['message'] as String,
      domain: json['domain'] as String,
      reason: json['reason'] as String);
}

Map<String, dynamic> _$_ErrorsModelChildToJson(_ErrorsModelChild instance) =>
    <String, dynamic>{
      'message': instance.message,
      'domain': instance.domain,
      'reason': instance.reason
    };
