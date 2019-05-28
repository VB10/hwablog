import 'dart:convert';

import 'package:hwablog/core/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:hwablog/core/services/key.dart';

/// The service responsible for networking requests
class Api {
  final String END_POINT =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty';

  var client = new http.Client();

  Future<User> signinUser(User user) async {
    // Get user profile for id
    print(user.toJson());
    var response = await client.post(
        '$END_POINT/verifyPassword?key=${ApiHelper.API_KEY}',
        body: user.toJson());
    print(response);
    // Convert and return
    // return User.fromJson(json.decode(response.body));
  }
}
