// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingModel _$ShoppingModelFromJson(Map<String, dynamic> json) {
  return ShoppingModel()
    ..company = json['company'] as String
    ..item = json['item'] as String
    ..price = json['price'] as String;
}

Map<String, dynamic> _$ShoppingModelToJson(ShoppingModel instance) =>
    <String, dynamic>{
      'company': instance.company,
      'item': instance.item,
      'price': instance.price
    };
