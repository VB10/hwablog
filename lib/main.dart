import 'package:flutter/material.dart';
import 'package:hwablog/ui/router.dart';

import 'core/services/base/rtest.dart';
import 'locator.dart';

import 'main.reflectable.dart';

void main() {
  initializeReflectable();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
