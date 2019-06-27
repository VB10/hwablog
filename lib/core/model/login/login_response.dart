import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String kind;
  String localId;
  String email;
  String idToken;
  String refreshToken;
  LoginResponse(
      {this.kind,
      this.localId,
      this.email,
      this.idToken,
      this.refreshToken});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
