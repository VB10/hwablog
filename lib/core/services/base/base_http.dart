import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hwablog/core/enum/constants.dart';
import 'package:hwablog/core/model/base/query_model.dart';
import 'package:hwablog/core/model/login/login_refresh_request.dart';
import 'package:hwablog/core/services/api.dart';
import 'package:hwablog/core/services/shared_prefernces_api.dart';

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
    _type = HttpType.GET;
    _baseUrl = baseUrl + path;
    if (_queryParamsUrl.isNotEmpty) _baseUrl += _queryParamsUrl;
    return this;
  }

  BaseHttp post({String path, @required dynamic body}) {
    _type = HttpType.POST;
    _baseUrl = baseUrl + path;
    if (_queryParamsUrl.isNotEmpty) _baseUrl += _queryParamsUrl;
    _body = json.encode(body);
    return this;
  }

  Future<Response> fetch() async {
    if (_type == null) {
      return Future.error("Type must set get & post");
    }

    print(_baseUrl);
    print(_header);
    print(_type);
    switch (_type) {
      case HttpType.GET:
        var request = http.get(_baseUrl, headers: _header);
        return await _checkServiceResponse(request);
      case HttpType.POST:
        var request = http.post(_baseUrl, headers: _header, body: _body);
        return await _checkServiceResponse(request);
      default:
        return Future.error("We have mistakes.Pls set request type GET & POST");
    }
  }

  Future _checkServiceResponse(Future<Response> future) async {
    final response = await future;
    switch (response.statusCode) {
      case HttpStatus.ok:
        _queryParamsUrl = "";
        _header.clear();
        return response;
      case HttpStatus.unauthorized:
        var _refreshModel = LoginRefreshTokenRequest(
            grant_type: AppConstants.REFRESH_TOKEN,
            refreshToken: SharedManager().refreshToken);
        await Api().refreshToken(_refreshModel);
        setNewTokenInUrl();
        return await fetch();
      default:
        return Future.error(response.body);
    }
  }

  void setNewTokenInUrl() {
    _baseUrl = _baseUrl.replaceFirst("auth", "auth2");
    if (_baseUrl.contains("&")) {
      _baseUrl += "&${AppConstants.AUTH}=${SharedManager().token}";
    } else {
      _baseUrl += "?${AppConstants.AUTH}=${SharedManager().token}";
    }
    print("new base url $_baseUrl");
  }
}
