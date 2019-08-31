import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hwablog/core/model/error/error_firebase.dart';
import 'package:hwablog/core/model/login/login_refresh_request.dart';
import 'package:hwablog/core/model/login/login_refresh_response.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/services/key.dart';
import 'package:hwablog/core/services/shared_prefernces_api.dart';

/// The service responsible for networking requests
class Api {
  final _client = new http.Client();

  Future siginUser(LoginRequest login) {
    Completer _completer = new Completer();
    _client
        .post(
            '${ApiHelper.AUTH_END_POINT}/verifyPassword?key=${ApiHelper.API_KEY}',
            body: login.toJson())
        .then((val) {
      final body = json.decode(val.body);
      switch (val.statusCode) {
        case 200:
          _completer.complete(LoginResponse.fromJson(body));
          return;
        case 400:
          _completer.completeError(ErrorFirebaseModel.fromJson(body));
          return;
      }
    });
    return _completer.future;
  }

  Future refreshToken(LoginRefreshTokenRequest refreshModel) async {
    final response = await _client.post(
        '${ApiHelper.AUTH_REFRESH_POINT}/token?key=${ApiHelper.API_KEY}',
        body: refreshModel.toJson());
    final body = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var refreshUser = LoginRefreshTokenResponse.fromJson(body);
        SharedManager().token = refreshUser.id_token;
        SharedManager().refreshToken = refreshUser.refresh_token;
        return true;

      default:
        log(ErrorFirebaseModel.fromJson(body).error.message);
        return false;
    }
  }
}
