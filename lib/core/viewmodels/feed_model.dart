import 'package:flutter/cupertino.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/feed/feed_model.dart';
import 'package:hwablog/core/services/feed_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';
import 'base_model.dart';

class FeedModel extends BaseModel {
  FeedApi _feedApi = locator<FeedApi>();
  String _token_id;
  List<ShoppingModel> shopList;
  BuildContext context;

  FeedModel() {
    shopList = new List<ShoppingModel>();
    _token_id = "";
  }
  Future getShoppingList() async {
    setState(ViewState.Busy);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _token_id = prefs.getString(UserLocalState.TOKEN_ID.toString());

    _feedApi.shopList(_token_id).then(onSuccess).catchError(onError);
  }

  void onSuccess(response) {
    final _list = response as List<ShoppingModel>;
    shopList.addAll(_list);
    setState(ViewState.Idle);
  }

  void onError(response) {
    setState(ViewState.Idle);
    if (response["status"] == 401) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          EnumConverter.stringFromEnum(RouteState.TAB),
          ModalRoute.withName('/'));
    }
  }

  void shoopingListAddPage(int index) {
    if (index >= shopList.length - 1) {
      _feedApi
          .shopListPageOrderbyKey(
              key: shopList[index].key, user_token: _token_id)
          .then(onSuccessPager)
          .catchError(onError);
    }
  }

  void onSuccessPager(response) {
    final _list = response as List<ShoppingModel>;
    //firebase always return get key child.
    if (_list.length > 1) {
      _list.removeAt(0);
      shopList.addAll(_list);
    }
    ;
    setState(ViewState.Idle);
  }
}
