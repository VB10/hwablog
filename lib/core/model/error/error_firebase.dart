import 'package:json_annotation/json_annotation.dart';
part 'error_firebase.g.dart';

@JsonSerializable()
class ErrorFirebaseModel {
  _ErrorModelChild error;

  ErrorFirebaseModel({this.error});
  factory ErrorFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorFirebaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorFirebaseModelToJson(this);
}

@JsonSerializable()
class _ErrorModelChild {
  int code;
  String message;
  List<_ErrorsModelChild> errors;

  _ErrorModelChild({
    this.code,
    this.message,
    this.errors
  });
  factory _ErrorModelChild.fromJson(Map<String, dynamic> json) =>
      _$_ErrorModelChildFromJson(json);
}

@JsonSerializable()
class _ErrorsModelChild {
  String message;
  String domain;
  String reason;

  _ErrorsModelChild({this.message, this.domain, this.reason});
  factory _ErrorsModelChild.fromJson(Map<String, dynamic> json) =>
      _$_ErrorsModelChildFromJson(json);
}
