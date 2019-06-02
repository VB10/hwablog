import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/feed/feed_model.dart';
import 'package:hwablog/core/services/feed_api.dart';

import '../../locator.dart';
import 'base_model.dart';

class FeedModel extends BaseModel {
  FeedApi _feedApi = locator<FeedApi>();

  List<ShoppingModel> shopList;

  FeedModel() {
    shopList = new List<ShoppingModel>();
  }
  Future getShopping() async {
    setState(ViewState.Busy);
    _feedApi.shopList().then(onSuccess).catchError(onError);
  }

  void onSuccess(response) {
    final _list = response as List<ShoppingModel>;
    shopList.addAll(_list);
    setState(ViewState.Idle);
  }

  void onError(response) {}
}
