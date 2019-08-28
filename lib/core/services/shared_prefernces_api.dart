import 'package:hwablog/core/enum/viewstate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  /// [factory] init.
  SharedManager._privateConstructor() {
    SharedPreferences.getInstance().then((prefs) {
      this.prefs = prefs;
    });
  }

  static final SharedManager _instance = SharedManager._privateConstructor();
  factory SharedManager() {
    if (_instance.prefs == null) SharedManager._privateConstructor();
    return _instance;
  }

  SharedPreferences prefs;

  Future initInstance() async {
    this.prefs = await SharedPreferences.getInstance();
  }

  logOut() {
    prefs.clear();
  }

  /// It's return [empty] value at first init
  String get token => prefs.getString(ClientSharedEnum.token.toString()) ?? "";

  set token(String token) {
    prefs.setString(ClientSharedEnum.token.toString(), token);
  }

  /// It's return [empty] value at first init
  String get refreshToken =>
      prefs.get(ClientSharedEnum.refreshToken.toString()) ?? "";

  set refreshToken(String refreshToken) {
    prefs.setString(ClientSharedEnum.refreshToken.toString(), refreshToken);
  }
}
