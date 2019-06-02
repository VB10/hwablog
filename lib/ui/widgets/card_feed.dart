import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  FeedCard({Key key, this.children,this.title,this.desc}) : super(key: key);
  final List<Widget> children;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
