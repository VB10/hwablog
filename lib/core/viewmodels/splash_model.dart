import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/model/error/error_firebase.dart';
import 'package:hwablog/core/model/login/login_refresh_response.dart';
import 'package:hwablog/core/services/shared_prefernces_api.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashModel extends BaseModel {
  BuildContext _context;
  SharedPreferences prefs;
  Future controlUserLocalData() async {
    //shared manager factory init
    await SharedManager().initInstance();

    if (SharedManager().token.isEmpty) {
      Navigator.of(_context).pushNamedAndRemoveUntil(
          EnumConverter.stringFromEnum(RouteState.LOGIN),
          ModalRoute.withName('/'));
    } else {
      Navigator.of(_context).pushNamedAndRemoveUntil(
          EnumConverter.stringFromEnum(RouteState.HOME),
          ModalRoute.withName('/'));

          // We will add next lesson refresh token. 
      // LoginRefreshTokenRequest refreshTokenRequest = LoginRefreshTokenRequest(
      //   grant_type: "refreshToken",
      //   refreshToken: prefs.getString(
      //     UserLocalState.TOKEN_REFRESH.toString(),
      //   ),
      // );
      // _api
      //     .refreshToken(refreshTokenRequest)
      //     .then(onSuccess)
      //     .catchError(onError);
    }
  }

  // void onSuccess(dynamic val) {
  //   final model = val as LoginRefreshTokenResponse;
  //   SharedManager().token = model.idToken;
  //   SharedManager().refreshToken = model.refreshToken;

  //   Navigator.of(_context).pushNamedAndRemoveUntil(
  //       EnumConverter.stringFromEnum(RouteState.HOME),
  //       ModalRoute.withName('/'));
  // }

  void onError(dynamic val) {
    final model = val as ErrorFirebaseModel;
    print(model.error.message);
    Navigator.of(_context).pushNamedAndRemoveUntil(
        EnumConverter.stringFromEnum(RouteState.LOGIN),
        ModalRoute.withName('/'));
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }
}
