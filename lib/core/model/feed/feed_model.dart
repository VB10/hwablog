import 'package:json_annotation/json_annotation.dart';
part 'feed_model.g.dart';

@JsonSerializable()
class ShoppingModel {
  String company;
  String item;
  String price;

  ShoppingModel({this.company, this.item, this.price});
  factory ShoppingModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingModelToJson(this);
}
