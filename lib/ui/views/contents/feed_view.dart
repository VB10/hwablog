import 'package:flutter/material.dart';
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
          child: Center(
            child: Text("Sample Text"),
          ),
        ));
      },
    );
  }
}
