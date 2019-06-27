// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_refresh_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRefreshTokenResponse _$LoginRefreshTokenResponseFromJson(
    Map<String, dynamic> json) {
  return LoginRefreshTokenResponse()
    ..access_token = json['access_token'] as String
    ..token_type = json['token_type'] as String
    ..refresh_token = json['refresh_token'] as String
    ..id_token = json['id_token'] as String
    ..expiresIn = json['expiresIn'] as int
    ..user_id = json['user_id'] as String
    ..project_id = json['project_id'] as String;
}

Map<String, dynamic> _$LoginRefreshTokenResponseToJson(
        LoginRefreshTokenResponse instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'refresh_token': instance.refresh_token,
      'id_token': instance.id_token,
      'expiresIn': instance.expiresIn,
      'user_id': instance.user_id,
      'project_id': instance.project_id
    };
