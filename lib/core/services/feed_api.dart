import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hwablog/core/model/error_firebase.dart';
import 'package:hwablog/core/model/error_firebase_auth.dart';
import 'package:hwablog/core/model/feed/feed_model.dart';
import 'package:hwablog/core/services/key.dart';

/// The service responsible for networking requests
class FeedApi {
  final _client = new http.Client();

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
          _completer. complete(_shoppingModel);
          break;
        case 400:
          Map<String, dynamic> _errorMap = new Map<String, dynamic>();
          _errorMap["status"] = val.statusCode;
          _errorMap["model"] = ErrorFirebaseModel.fromJson(body);
          _completer.completeError(_errorMap);
          break;
        case 401:
        // TODO : firebase auth open and error control
          Map<String, dynamic> _errorMap = new Map<String, dynamic>();
          _errorMap["status"] = val.statusCode;
          _errorMap["model"] = ErrorFirebaseAuthModel.fromJson(body);
          _completer.completeError(ErrorFirebaseAuthModel.fromJson(body));
          break;
      }
    });
    return _completer.future;
  }
}
