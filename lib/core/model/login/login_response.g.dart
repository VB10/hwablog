// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
      kind: json['kind'] as String,
      localId: json['localId'] as String,
      email: json['email'] as String,
      idToken: json['idToken'] as String,
      refreshToken: json['refreshToken'] as String);
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'localId': instance.localId,
      'email': instance.email,
      'idToken': instance.idToken,
      'refreshToken': instance.refreshToken
    };
