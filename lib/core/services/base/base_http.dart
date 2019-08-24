import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:hwablog/core/model/base/query_model.dart';
import 'package:hwablog/core/services/base/result_model.dart';
import 'package:hwablog/core/services/base/test.dart';
import 'package:hwablog/core/services/base/todo.dart';
import 'package:matcher/matcher.dart';
import 'package:matcher/matcher.dart' as prefix0;
import 'package:reflectable/mirrors.dart';

import 'reflect.dart';

enum HttpType { GET, POST }

class BaseHttp<T extends BaseJsonModel, E extends BaseJsonModel> {
  final String baseUrl;
  Map<String, String> _header;
  String _queryParamsUrl;
  String _baseUrl = "";
  dynamic _body;
  HttpType _type;

  T _responseModel;
  E _errorModel;

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

  Future<T> get<T extends BaseJsonModel>({String path}) async {
    // T.fromJson();
    if (_queryParamsUrl.isNotEmpty) _baseUrl = baseUrl + _queryParamsUrl;

    final response = await http.get(path, headers: _header);
    var x = (T as dynamic);
    final body = json.decode(response.body);
    print(Todo.fromJson(body));
    ClassMirror classMirror = reflector.reflectType(T);
    var mirror = classMirror.newInstance("fromJson", [body]);
    print(mirror);
    return x;

    // x.fromJson();

    // return this;
  }

  T cast<T>(x) => x is T ? x : null;

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

  Future fetch<T extends BaseJsonModel>() async {
    switch (_type) {
      case HttpType.GET:
        final jsonModel = (T as BaseJsonModel);

        // T.ba

        final response = await http.get(_baseUrl, headers: _header);
        // var result = _responseModel.fromJson(json.decode(response.body));
        // return result;
        break;
      case HttpType.POST:
        return await http.post(_baseUrl, headers: _header, body: _body);
    }
  }
}
