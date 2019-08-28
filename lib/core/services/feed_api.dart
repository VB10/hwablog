import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hwablog/core/enum/constants.dart';
import 'package:hwablog/core/model/base/query_model.dart';
import 'package:hwablog/core/model/error/error_firebase_auth.dart';
import 'package:hwablog/core/model/feed/feed_model.dart';
import 'package:hwablog/core/services/base/base_api.dart';
import 'package:hwablog/core/services/key.dart';
import 'package:hwablog/core/viewmodels/feed_model.dart';

/// The service responsible for networking requests
class FeedApi {
  final client = ApiManager.instance().baseHttp;

  Future postShopItem() async {
    // var x =
    // await _apiManager.addQuery(QueryModel(key: "a", value: "asd")).getR();
  }

  Future shopList(String tokenId) async {
    final response = await client
        .addQuery(key: AppConstants.START_AT, value: "\" \"")
        .addQuery(key: AppConstants.ORDER_BY, value: "\"\$key\"")
        .addQuery(key: AppConstants.LIMIT_TO_FIRST, value: "5")
        .addQuery(key: AppConstants.AUTH, value: tokenId)
        .get(path: "shopping.json")
        .fetch();
    if (response.statusCode == HttpStatus.ok) {
      List<ShoppingModel> listFeed = [];
      final body = json.decode(response.body);
      body.forEach((key, value) {
        ShoppingModel responsChildValue = ShoppingModel.fromJson(value);
        listFeed.add(responsChildValue);
      });
      return listFeed;
    } else {
      return Future.error(response.body);
    }
  }

  Future shopListPageOrderbyKey({String key, String user_token}) {
    Completer _completer = new Completer();
    String _advanceUrl = ApiHelper.database_mix_endpoint(
        child: "shopping",
        startAt: "$key",
        orderBy: "key",
        limitCount: ApiHelper.DATABASE_LIMIT_COUNT,
        orderType: DatabaseLimit.limitToFirst,
        auth: user_token);

    // _client.get(_advanceUrl).then((val) {
    //   final body = json.decode(val.body) as Map<String, dynamic>;
    //   switch (val.statusCode) {
    //     case 200:
    //       List<ShoppingModel> _shoppingModel = new List<ShoppingModel>();
    //       body.forEach((key, value) {
    //         ShoppingModel _model = ShoppingModel.fromJson(value);
    //         _model.key = key;
    //         _shoppingModel.add(_model);
    //       });
    //       _completer.complete(_shoppingModel);
    //       break;
    //     case 400:
    //     case 401:
    //       Map<String, dynamic> _errorMap = new Map<String, dynamic>();
    //       _errorMap["status"] = val.statusCode;
    //       _errorMap["model"] = ErrorFirebaseAuthModel.fromJson(body);
    //       print("error ${ErrorFirebaseAuthModel.fromJson(body).error}");
    //       _completer.completeError(_errorMap);
    //       break;
    //   }
    // });
    return _completer.future;
  }
}
