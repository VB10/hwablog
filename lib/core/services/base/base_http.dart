import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hwablog/core/model/base/query_model.dart';

enum HttpType { GET, POST }

class BaseHttp {
  final String baseUrl;
  Map<String, String> _header;
  String _queryParamsUrl;
  String _baseUrl = "";
  dynamic _body;
  HttpType _type;

  BaseHttp({@required this.baseUrl}) {
    _queryParamsUrl = "";
    _baseUrl = "";
    _header = Map<String, String>();
  }

  BaseHttp addQueryModel(QueryModel queryModel) {
    if (!_queryParamsUrl.contains("?")) {
      _queryParamsUrl += "?${queryModel.key}=${queryModel.value}";
    } else {
      _queryParamsUrl += "&${queryModel.key}=${queryModel.value}";
    }
    return this;
  }

  BaseHttp addQuery({String key, String value}) {
    if (!_queryParamsUrl.contains("?")) {
      _queryParamsUrl += "?$key=$value";
    } else {
      _queryParamsUrl += "&$key=$value";
    }
    return this;
  }

  BaseHttp addHeader({@required String key, @required String value}) {
    if (key.isNotEmpty & value.isNotEmpty) {
      _header[key] = value;
    }
    return this;
  }

  BaseHttp get({String path}) {
    if (_queryParamsUrl.isNotEmpty) _baseUrl = baseUrl + _queryParamsUrl;
    return this;
  }

  BaseHttp post({String path, dynamic body}) {
    if (_queryParamsUrl.isNotEmpty)
      _baseUrl = baseUrl + _queryParamsUrl;
    else
      _baseUrl = baseUrl;

    if (body != null) {
      _body = body;
    }
    return this;
  }

  Future<Response> fetch() async {
    switch (_type) {
      case HttpType.GET:
        return await http.get(_baseUrl, headers: _header);
      case HttpType.POST:
        return await http.post(_baseUrl, headers: _header, body: _body);
      default:
        return await http.post(_baseUrl, headers: _header, body: _body);
    }
  }
}
