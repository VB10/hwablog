import 'package:flutter/material.dart';
import 'package:hwablog/ui/views/tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Segment Demo',
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => TabView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
