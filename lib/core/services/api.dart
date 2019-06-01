import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hwablog/core/model/error_firebase.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/services/key.dart';

/// The service responsible for networking requests
class Api {
  final String _END_POINT =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty';

  final _client = new http.Client();

  Future<LoginResponse> signinUser(LoginRequest user) async {
    // Get user profile for id
    print(user.toJson());
    var response = await _client.post(
        '$_END_POINT/verifyPassword?key=${ApiHelper.API_KEY}',
        body: user.toJson());
    final body = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        return LoginResponse.fromJson(body);
      default:
        // print("${ErrorFirebaseModel.fromJson(body).error}");
        return null;
    }
  }

  Future signin(LoginRequest login) {
    Completer _completer = new Completer();

    _client
        .post('$_END_POINT/verifyPassword?key=${ApiHelper.API_KEY}',
            body: login.toJson())
        .then((val) {
      switch (val.statusCode) {
        case 200:
          final body = json.decode(val.body);
          _completer.complete(LoginResponse.fromJson(body));
          return;
        case 400:
          final body = json.decode(val.body);
          _completer.completeError(ErrorFirebaseModel.fromJson(body));
          return;
      }
    });

    //     .then((val) {
    //   final body = json.decode(val.body);
    //   _completer.complete(LoginResponse.fromJson(body));
    // }).catchError((error) {
    //   final body = json.decode(error.body);
    //   _completer.completeError(ErrorFirebaseModel.fromJson(body));
    // });

    return _completer.future;
  }
}
