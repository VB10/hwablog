import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/feed/shop_model.dart';
import 'package:hwablog/core/services/feed_api.dart';
import 'package:hwablog/core/services/shared_prefernces_api.dart';
import 'package:hwablog/ui/shared/ui_helpers.dart';
import 'package:hwablog/ui/widgets/form.dart';

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
    final shopList = await _feedApi.shopList(SharedManager().token);
    setState(ViewState.Idle);
    if (shopList is List<ShoppingModel>) {
      this.shopList = shopList;
    } else {}
  }

  void addShopItem() {
    showDialog(
      context: _context,
      builder: (context) => Dialog(
        child: ShopForm(
          onPressed: _addShopItemModel,
        ),
      ),  
    );
  }

  Future _addShopItemModel(ShoppingModel model, bool isValid) async {
    if (isValid) {
      Navigator.pop(_context);
      _showSnackbar(Text("Uploading your post..."));
      final result = await _feedApi.addShopItem(model.toJson());
      if (result) {
        _showSnackbar(Text("It's success share for post"));
        await getShoppingList();
      } else {
        _showSnackbar(Text("$result"));
      }
    }
  }

  void _showSnackbar(Widget widget) {
    UIHelper.showSnackbar(feedScaffoldKey, child: widget);
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }
}
