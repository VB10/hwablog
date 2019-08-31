import 'package:get_it/get_it.dart';
import 'package:hwablog/core/viewmodels/splash_model.dart';

import 'core/services/api.dart';
import 'core/viewmodels/feed_model.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(Api());
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => FeedModel());
  locator.registerFactory(() => SplashModel());
}
