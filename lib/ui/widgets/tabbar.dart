import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  TabbarWidget(
      {Key key,
      @required this.body,
      @required this.header,
      @required this.image})
      : super(key: key);

  final List<Widget> body;
  final List<Widget> header;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: this.header.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: image,
          bottom: TabBar(
            tabs: this.header,
          ),
        ),
        body: TabBarView(
          children: this.body,
        ),
      ),
    );
  }
}
