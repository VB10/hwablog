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
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                        return Card(
                            elevation: 10,
                            margin: EdgeInsets.all(8),
                            child: Column(
                              children: <Widget>[
                                Image.network(
                                  "https://picsum.photos/200",
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                                ListTile(
                                  title: Text(model.shopList[index].item),
                                  subtitle: Text(model.shopList[index].price),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Sepete eklendi."),
                                      ));
                                    },
                                  ),
                                ),
                              ],
                            ));
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
