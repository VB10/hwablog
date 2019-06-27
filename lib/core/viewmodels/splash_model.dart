import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/model/error/error_firebase.dart';
import 'package:hwablog/core/model/login/login_refresh_request.dart';
import 'package:hwablog/core/model/login/login_refresh_response.dart';
import 'package:hwablog/core/services/api.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../locator.dart';

class SplashModel extends BaseModel {
  Api _api = locator<Api>();
  BuildContext _context;
  SplashModel() {}
  SharedPreferences prefs;
  Future controlUserLocalData() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString(UserLocalState.TOKEN_ID.toString()) == null ||
        prefs.getString(UserLocalState.TOKEN_REFRESH.toString()) == null) {
      Navigator.of(_context).pushNamedAndRemoveUntil(
          EnumConverter.stringFromEnum(RouteState.TAB),
          ModalRoute.withName('/'));
    } else {
      LoginRefreshTokenRequest refreshTokenRequest = LoginRefreshTokenRequest(
        grant_type: "refresh_token",
        refresh_token: prefs.getString(
          UserLocalState.TOKEN_REFRESH.toString(),
        ),
      );
      _api
          .refresh_token(refreshTokenRequest)
          .then(onSuccess)
          .catchError(onError);
    }
  }

  void onSuccess(dynamic val) {
    final model = val as LoginRefreshTokenResponse;
    prefs.setString(UserLocalState.TOKEN_ID.toString(), model.id_token);
    prefs.setString(
        UserLocalState.TOKEN_REFRESH.toString(), model.refresh_token);
    Navigator.of(_context).pushNamedAndRemoveUntil(
        EnumConverter.stringFromEnum(RouteState.HOME),
        ModalRoute.withName('/'));
  }

  void onError(dynamic val) {
    final model = val as ErrorFirebaseModel;
    print(model.error.message);
    Navigator.of(_context).pushNamedAndRemoveUntil(
        EnumConverter.stringFromEnum(RouteState.TAB), ModalRoute.withName('/'));
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
    _context = context;
    
  }
}
