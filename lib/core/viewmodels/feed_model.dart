import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/error/error_firebase.dart';
import 'package:hwablog/core/model/feed/feed_model.dart';
import 'package:hwablog/core/services/feed_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_model.dart';

class FeedModel extends BaseModel {
  String tokenId;
  List<ShoppingModel> shopList = [];
  BuildContext _context;
  GlobalKey<ScaffoldState> feedScaffoldKey;

  FeedApi _feedApi;

  FeedModel() {
    tokenId = "";
    _feedApi = FeedApi();
    feedScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "feedScaffoldKey");
  }
  Future getShoppingList() async {
    setState(ViewState.Busy);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenId = prefs.getString(UserLocalState.TOKEN_ID.toString());
    final shopList = await _feedApi.shopList(tokenId);
    setState(ViewState.Idle);
    if (shopList is List<ShoppingModel>) {
      this.shopList = shopList;
    } else {}
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }
}
