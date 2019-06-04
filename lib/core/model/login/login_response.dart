import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String kind;
  String localId;
  String email;
  String id_token;
  String refreshToken;
  LoginResponse(
      {this.kind,
      this.localId,
      this.email,
      this.id_token,
      this.refreshToken});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
