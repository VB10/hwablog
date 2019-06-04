import 'package:flutter/material.dart';

class SliverCustomListWidget extends StatelessWidget {
  SliverCustomListWidget(
      {Key key, this.height, @required this.children, @required this.spaceBar})
      : super(key: key);

  final List<Widget> children;
  final FlexibleSpaceBar spaceBar;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: height ?? 200.0,
          backgroundColor: Colors.black87,
          flexibleSpace: this.spaceBar,
        ),
        ...children
      ],
    );
  }
}
