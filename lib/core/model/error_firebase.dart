import 'package:json_annotation/json_annotation.dart';
part 'error_firebase.g.dart';

@JsonSerializable()
class ErrorFirebaseModel {
  List<ErrorModelChild> error;

  ErrorFirebaseModel({this.error});
  factory ErrorFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorFirebaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorFirebaseModelToJson(this);
}

@JsonSerializable()
class ErrorModelChild {
  String code;
  String message;

  ErrorModelChild({this.code, this.message});
    factory ErrorModelChild.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelChildFromJson(json);
}
