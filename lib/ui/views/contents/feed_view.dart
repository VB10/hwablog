import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/feed/shop_model.dart';
import 'package:hwablog/core/viewmodels/feed_model.dart';
import 'package:hwablog/ui/shared/ui_helpers.dart';
import 'package:hwablog/ui/views/baseview.dart';
import 'package:hwablog/ui/widgets/sliver_list.dart';

class FeedView extends StatefulWidget {
  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  FeedModel _feedModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedModel>(
      onModelReady: (model) {
        _feedModel = model;
        model.setContext(context);
        model.getShoppingList();
      },
      builder: (context, model, child) {
        return Scaffold(
          key: model.feedScaffoldKey,
          floatingActionButton: _fabButton,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: SliverCustomListWidget(
            spaceBar: _spaceBar,
            children: <Widget>[
              _loadingWidget,
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) =>
                      _feedCard(model.shopList[index]),
                  childCount: model.shopList.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: _feedModel.addShopItem,
        child: Icon(Icons.add),
      );

  Widget get _spaceBar => FlexibleSpaceBar(
        centerTitle: false,
        title: Text("Feeds"),
        background: Image.asset(
          UIHelper.image("mediumH.jpg"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      );

  Widget get _loadingWidget => SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Visibility(
              visible: _feedModel.state == ViewState.Busy,
              child: LinearProgressIndicator()),
        ),
      );

  Widget _feedCard(ShoppingModel shop) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.network(
            "https://picsum.photos/200",
          ),
          ListTile(
            title: Text(shop.item),
            subtitle: Text(shop.price),
          ),
        ],
      ),
    );
  }
}
