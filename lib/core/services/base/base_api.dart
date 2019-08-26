import 'package:hwablog/core/services/key.dart';

import 'base_http.dart';

class ApiManager {
  BaseHttp baseHttp;
  
  static ApiManager _instance;
  ApiManager._privateInit() {
    baseHttp = new BaseHttp(baseUrl: ApiHelper.DATABASE_URL);
  }

  static ApiManager instance() {
    if (_instance == null) {
      _instance = new ApiManager._privateInit();
    }
    return _instance;
  }
}
