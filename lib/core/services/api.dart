import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hwablog/core/model/error_firebase.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/services/key.dart';

/// The service responsible for networking requests
class Api {

  final _client = new http.Client();

  Future signin(LoginRequest login) {
    Completer _completer = new Completer();
    _client
        .post('${ApiHelper.AUTH_END_POINT}/verifyPassword?key=${ApiHelper.API_KEY}',
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
}
