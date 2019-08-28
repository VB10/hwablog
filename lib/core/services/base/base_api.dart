import 'base_http.dart';

class ApiManager {
  BaseHttp baseHttp;
  
  static ApiManager _instance;
  ApiManager._privateInit() {
    baseHttp = new BaseHttp(baseUrl: "https://hwaproject-3da21.firebaseio.com/");
  }

  static ApiManager instance() {
    if (_instance == null) {
      _instance = new ApiManager._privateInit();
    }
    return _instance;
  }
}
