import 'package:hwablog/core/services/base/result_model.dart';

class Test extends BaseJsonModel {
  String data;

  Test({this.data});

  Test.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}
