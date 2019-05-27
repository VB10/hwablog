import 'package:flutter/material.dart';
import 'package:hwablog/ui/widgets/tabbar.dart';
import 'package:hwablog/ui/widgets/tabbar_header.dart';

import 'login.dart';

class TabView extends StatefulWidget {
  const TabView({Key key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  List<HeaderTabWidget> _headerTabWidget;
  List<Widget> _children;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _headerTabWidget = new List<HeaderTabWidget>();
    _children = new List<Widget>();

    _headerTabWidget.add(HeaderTabWidget(
      color: Colors.transparent,
      title: "Login",
    ));
    _headerTabWidget.add(HeaderTabWidget(
      color: Colors.transparent,
      title: "Signup",
    ));
    _children.add(LoginView());
    _children.add(Container(color: Colors.blue));
  }

  @override
  Widget build(BuildContext context) {
    return TabbarWidget(
      header: _headerTabWidget,
      body: _children,
      image: Image.network(
        "https://img.purch.com/w/660/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzA5Ny85NTcvb3JpZ2luYWwvc3BhY2UuanBn",
        fit: BoxFit.cover,
      ),
    );
  }
}
