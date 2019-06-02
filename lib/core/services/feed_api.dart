import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hwablog/core/model/error_firebase.dart';
import 'package:hwablog/core/model/feed/feed_model.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/services/key.dart';

/// The service responsible for networking requests
class FeedApi {
  final _client = new http.Client();

  Future<LoginResponse> getShopList() async {
    // Get user profile for id
    var response = await _client.get(
      '${ApiHelper.DATABASE_URL}/shopping.json',
    );
    final Map body = json.decode(response.body);

    switch (response.statusCode) {
      case 200:
        List<ShoppingModel> _shoppingModel = new List<ShoppingModel>();
        for (var item in body.values) {
          _shoppingModel.add(ShoppingModel.fromJson(item));
        }

        return null;
      default:
        // print("${ErrorFirebaseModel.fromJson(body).error}");
        return null;
    }
  }

  Future shopList() {
    Completer _completer = new Completer();

    _client
        .get(
      '${ApiHelper.DATABASE_URL}/shopping.json',
    )
        .then((val) {
      final body = json.decode(val.body);
      switch (val.statusCode) {
        case 200:
          List<ShoppingModel> _shoppingModel = new List<ShoppingModel>();
          for (var item in body.values) {
            _shoppingModel.add(ShoppingModel.fromJson(item));
          }
          _completer.complete(_shoppingModel);
          return;
        case 400:
          _completer.completeError(ErrorFirebaseModel.fromJson(body));
          return;
      }
    });
    return _completer.future;
  }
}
