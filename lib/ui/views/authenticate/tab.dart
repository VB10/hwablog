import 'package:flutter/material.dart';
import 'package:hwablog/ui/widgets/tabbar.dart';
import 'package:hwablog/ui/widgets/tabbar_header.dart';

import 'login_view.dart';



class TabView extends StatefulWidget {
  const TabView({Key key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return TabbarWidget(
      header: <Widget>[
        HeaderTabWidget(
          color: Colors.transparent,
          title: "Login",
        ),
        HeaderTabWidget(
          color: Colors.transparent,
          title: "Signup",
        )
      ],
      body: <Widget>[
        Center(
          child: SingleChildScrollView(
            reverse: true,
            child: LoginView(),
          ),
        ),
        Container(color: Colors.blue)
      ],
      image: Image.network(
        "https://img.purch.com/w/660/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzA5Ny85NTcvb3JpZ2luYWwvc3BhY2UuanBn",
        fit: BoxFit.cover,
      ),
    );
  }
}
