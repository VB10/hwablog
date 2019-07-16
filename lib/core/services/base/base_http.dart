import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hwablog/core/model/base/query_model.dart';
import 'package:hwablog/core/model/feed/feed_model.dart';

class BaseHttp {
  final String baseUrl;
  BaseHttp({@required this.baseUrl}) {
    _queryParamsUrl = "";
  }

  String _queryParamsUrl;
  dynamic _body;

  BaseHttp addQuery(QueryModel queryModel) {
    if (!_queryParamsUrl.contains("?")) {
      _queryParamsUrl += "?${queryModel.key}=${queryModel.value}";
    } else {
      _queryParamsUrl += "&${queryModel.key}=${queryModel.value}";
    }
    return this;
  }

  BaseHttp addBody(dynamic model) {
    if (model == null) {
      _body = model;
    }
    return this;
  }

  Future<Response> getR(HttpType type) {
    String _url = "";
    if (_queryParamsUrl.isNotEmpty) _url = "baseUrl" + _queryParamsUrl;

    final xa = http.Request("", Uri());
  
    switch (type) {
      case HttpType.GET:
        return http.get(_url);
        break;
      case HttpType.POST:
        return http.post(_url, body: _body);
        break;
      default:
    }
    return http.get(_url);
  }

  post() {}
}

enum HttpType { POST, GET }
