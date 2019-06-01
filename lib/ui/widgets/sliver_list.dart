import 'package:flutter/material.dart';

class SliverCustomListWidget extends StatelessWidget {
  SliverCustomListWidget(
      {Key key, this.height, @required this.child, @required this.spaceBar})
      : super(key: key);

  final Widget child;
  final FlexibleSpaceBar spaceBar;
  final double height;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: height ?? 200.0,
            backgroundColor: Colors.black87,
            floating: false,
            pinned: true,
            flexibleSpace: this.spaceBar,
          ),
        ];
      },
      body: child,
    );
  }
}
