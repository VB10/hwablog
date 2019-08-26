import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:hwablog/core/enum/service_constant.dart';
import 'package:hwablog/core/model/base/query_model.dart';
import 'package:hwablog/core/services/base/result_model.dart';
import 'package:hwablog/core/services/base/test.dart';
import 'package:hwablog/core/services/base/todo.dart';
import 'package:matcher/matcher.dart';
import 'package:matcher/matcher.dart' as prefix0;
import 'package:reflectable/mirrors.dart';

import 'reflect.dart';

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
    _baseUrl = baseUrl;
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

  /// Call database [child] value
  BaseHttp subChild(String child) {
    _baseUrl += "$child.json";
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

  Future get<T extends BaseJsonModel>(String path,
      {bool isList = false}) async {
    ClassMirror classMirror = reflector.reflectType(T);

    try {
      classMirror.newInstance(ServiceConstant.FROM_JSON, []);
    } catch (e) {
      if (e is TypeError == false) {
        return Future.error(
            "$T model must be set ${ServiceConstant.FROM_JSON} method");
      }
    }

    _baseUrl = "$baseUrl$path.json$_queryParamsUrl";
    print(_baseUrl);
    final response = await http.get(_baseUrl, headers: _header);
    if (response.statusCode == HttpStatus.ok) {
      final body = json.decode(response.body);
      if (isList) {
        var listRepsonse = List<T>();
        body.forEach((key, value) {
          T responsChildValue =
              classMirror.newInstance(ServiceConstant.FROM_JSON, [value]);
          listRepsonse.add(responsChildValue);
        });
        return listRepsonse;
      } else {
        T responsChildValue =
            classMirror.newInstance(ServiceConstant.FROM_JSON, [body]);
        return responsChildValue;
      }
    } else {
      print(response.body);
      return Future.error(response.body);
    }
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
