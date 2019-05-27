import 'package:flutter/material.dart';
class HeaderTabWidget extends StatelessWidget {
  const HeaderTabWidget({Key key, @required this.title, @required this.color})
      : super(key: key);

  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: this.color,
        child: Text(this.title),
      ),
    );
  }
}
