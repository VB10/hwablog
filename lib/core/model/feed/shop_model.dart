import 'package:json_annotation/json_annotation.dart';
part 'shop_model.g.dart';

@JsonSerializable()
class ShoppingModel {
  @JsonKey(ignore: true)
  String key;
  String company;
  String item;
  String price;
  String imageURL;

  ShoppingModel({this.company, this.item, this.price,this.imageURL});
  factory ShoppingModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingModelToJson(this);
}
