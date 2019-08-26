import 'package:hwablog/core/services/base/reflect.dart';
import 'package:hwablog/core/services/base/result_model.dart';

@reflector
class Shop implements BaseJsonModel {
  String key;
  String company;
  String item;
  String price;

  Shop({this.key, this.company, this.item, this.price});

  Shop.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    company = json['company'];
    item = json['item'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['company'] = this.company;
    data['item'] = this.item;
    data['price'] = this.price;
    return data;
  }
}
