import 'package:json_annotation/json_annotation.dart';

part 'login_refresh_response.g.dart';

@JsonSerializable()
class LoginRefreshTokenResponse {
  String access_token;
  String token_type;
  String refresh_token;
  String id_token;
  int expiresIn;
  String user_id;
  String project_id;
  LoginRefreshTokenResponse();
  factory LoginRefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginRefreshTokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRefreshTokenResponseToJson(this);
}
