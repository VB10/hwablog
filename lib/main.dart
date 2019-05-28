import 'package:flutter/material.dart';
import 'package:hwablog/ui/views/tab.dart';
import 'package:provider/provider.dart';

import 'core/model/user.dart';
import 'core/viewmodels/login_model.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      builder: (context) => locator<LoginModel>().userController,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'Segment Demo',
        initialRoute: '/',
        routes: {
          // When we navigate to the "/" route, build the FirstScreen Widget
          '/': (context) => TabView(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
