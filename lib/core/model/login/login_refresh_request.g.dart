// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_refresh_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRefreshTokenRequest _$LoginRefreshTokenRequestFromJson(
    Map<String, dynamic> json) {
  return LoginRefreshTokenRequest(
      grant_type: json['grant_type'] as String,
      refresh_token: json['refresh_token'] as String);
}

Map<String, dynamic> _$LoginRefreshTokenRequestToJson(
        LoginRefreshTokenRequest instance) =>
    <String, dynamic>{
      'grant_type': instance.grant_type,
      'refresh_token': instance.refresh_token
    };
