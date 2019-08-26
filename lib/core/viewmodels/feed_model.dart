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
  String _tokenID;
  List<Shop> shopList;
  BuildContext _context;

  FeedModel() {
    shopList = new List<Shop>();
    _tokenID = "";
  }
  Future getShoppingList() async {
    setState(ViewState.Busy);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenID = prefs.getString(UserLocalState.TOKEN_ID.toString());
    shopList = await _feedApi.shoppingList<Shop>(_tokenID);
    setState(ViewState.Idle);
  }

 

  void onError(response) {
    setState(ViewState.Idle);
    if (response["status"] == 401) {
      Navigator.of(_context).pushNamedAndRemoveUntil(
          EnumConverter.stringFromEnum(RouteState.TAB),
          ModalRoute.withName('/'));
    }
  }

  void shoopingListAddPage(int index) {
    if (index >= shopList.length - 1) {
      _feedApi
          .shopListPageOrderbyKey(key: shopList[index].key, userToken: _tokenID)
          .then(onSuccessPager)
          .catchError(onError);
    }
  }

  void onSuccessPager(response) {
    final _list = response as List<Shop>;
    //firebase always return get key child.
    if (_list.length > 1) {
      _list.removeAt(0);
      shopList.addAll(_list);
    }
    ;
    setState(ViewState.Idle);
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }
}
