import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hwablog/core/enum/constants.dart';
import 'package:hwablog/core/model/feed/shop_model.dart';
import 'package:hwablog/core/services/base/base_api.dart';
import 'package:hwablog/core/services/shared_prefernces_api.dart';

/// The service responsible for networking requests
class FeedApi {
  final client = ApiManager.instance().baseHttp;
  Future addShopItem(Map model) async {
    final response = await client
        .addQuery(key: AppConstants.AUTH, value: SharedManager().token)
        .post(path: "shopping.json", body: model)
        .fetch();

    if (response.statusCode == HttpStatus.ok) {
      log(response.body);
      return true;
    } else {
      return Future.error(response.body);
    }
  }

  Future shopList(String tokenId) async {
    final response = await client
        .addQuery(key: AppConstants.START_AT, value: "\" \"")
        .addQuery(key: AppConstants.ORDER_BY, value: "\"\$key\"")
        .addQuery(key: AppConstants.LIMIT_TO_FIRST, value: "20")
        .addQuery(key: AppConstants.AUTH, value: SharedManager().token)
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
}
