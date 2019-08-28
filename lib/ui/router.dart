import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/ui/views/authenticate/login_view.dart';
import 'package:hwablog/ui/views/authenticate/register_view.dart';
import 'package:hwablog/ui/views/authenticate/splash_view.dart';
import 'package:hwablog/ui/views/contents/feed_view.dart';

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
      case RouteState.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RouteState.NONE:
        return _nonePageRoute;
      case RouteState.HOME:
        return MaterialPageRoute(builder: (_) => FeedView());
      case RouteState.REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterView());
      default:
        // default page
        return MaterialPageRoute(builder: (_) => SplashView());
    }
  }
}
