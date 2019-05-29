import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/ui/views/register_view.dart';
import 'package:hwablog/ui/views/tab.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _routeName = EnumConverter.enumFromString(settings.name);
    final _nonePageRoute = MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    switch (_routeName) {
      case RouteState.TAB:
        return MaterialPageRoute(builder: (_) => TabView());
      case RouteState.NONE:
        return _nonePageRoute;
      case RouteState.REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterView());
      default:
        return MaterialPageRoute(builder: (_) => TabView());
    }
  }
}
