import 'package:json_annotation/json_annotation.dart';
part 'login_refresh_request.g.dart';

@JsonSerializable()
class LoginRefreshTokenRequest {
  String grant_type;
  String refresh_token;

  LoginRefreshTokenRequest({this.grant_type, this.refresh_token});
  factory LoginRefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRefreshTokenRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRefreshTokenRequestToJson(this);
}
