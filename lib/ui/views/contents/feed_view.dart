import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/viewmodels/feed_model.dart';
import 'package:hwablog/ui/shared/ui_helpers.dart';
import 'package:hwablog/ui/views/baseview.dart';
import 'package:hwablog/ui/widgets/sliver_list.dart';

class FeedView extends StatefulWidget {
  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FeedModel>(
      onModelReady: (model) {
        //call list
        model.getShopping();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: SliverCustomListWidget(
            spaceBar: FlexibleSpaceBar(
              centerTitle: false,
              title: Text("Feeds"),
              background: Image.asset(
                UIHelper.image("mediumH.jpg"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: model.state == ViewState.Busy
                ? SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        // To convert this infinite list to a list with three items,
                        // uncomment the following line:
                        // if (index > 3) return null;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.red,
                            height: 150.0,
                            child: Text(model.shopList[index].item),
                          ),
                        );
                      },
                      // Or, uncomment the following line:
                      childCount: model.shopList.length,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
