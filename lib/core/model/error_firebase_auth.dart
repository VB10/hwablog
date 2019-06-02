import 'package:json_annotation/json_annotation.dart';
part 'error_firebase_auth.g.dart';

@JsonSerializable()
class ErrorFirebaseAuthModel {
  String error;

  ErrorFirebaseAuthModel({
    this.error,
  });
  factory ErrorFirebaseAuthModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorFirebaseAuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorFirebaseAuthModelToJson(this);
}
