import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hwablog/core/model/error_firebase.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/services/key.dart';

/// The service responsible for networking requests
class Api {
  final String END_POINT =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty';

  var client = new http.Client();

  Future<LoginResponse> signinUser(LoginRequest user) async {
    // Get user profile for id
    print(user.toJson());
    var response = await client.post(
        '$END_POINT/verifyPassword?key=${ApiHelper.API_KEY}',
        body: user.toJson());
    final body = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        return LoginResponse.fromJson(body);
      default:
        print("${ErrorFirebaseModel.fromJson(body).error}");
        return null;
    }
  }
}
