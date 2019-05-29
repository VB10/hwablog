// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorFirebaseModel _$ErrorFirebaseModelFromJson(Map<String, dynamic> json) {
  return ErrorFirebaseModel(
      error: (json['error'] as List)
          ?.map((e) => e == null
              ? null
              : ErrorModelChild.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ErrorFirebaseModelToJson(ErrorFirebaseModel instance) =>
    <String, dynamic>{'error': instance.error};

ErrorModelChild _$ErrorModelChildFromJson(Map<String, dynamic> json) {
  return ErrorModelChild(
      code: json['code'] as String, message: json['message'] as String);
}

Map<String, dynamic> _$ErrorModelChildToJson(ErrorModelChild instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};
