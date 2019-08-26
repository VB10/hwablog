import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/error/error_firebase.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';
import 'package:hwablog/ui/shared/ui_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel extends BaseModel {
  TextEditingController userEmail;
  TextEditingController userPassword;
  GlobalKey<ScaffoldState> loginScaffoldKey;

  BuildContext _context;

  LoginModel() {
    userEmail = new TextEditingController();
    userPassword = new TextEditingController();
    loginScaffoldKey = new GlobalKey<ScaffoldState>(debugLabel: "login");
  }
  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState.validate()) {
      setState(ViewState.Busy);
      var _user = LoginRequest(
          email: userEmail.text.trim(),
          password: userPassword.text.trim(),
          returnSecureToken: true.toString());
      baseAPI.signinUser(_user).then(onSuccess).catchError(onError);
    } else
      return;
  }

  Future onSuccess(dynamic response) async {
    var model = response as LoginResponse;
    UIHelper.showSnackBar(loginScaffoldKey,
        child: Text("Welcome ${model.email}"));

    await saveUserState(model);

    Navigator.of(_context)
        .pushNamed(EnumConverter.stringFromEnum(RouteState.HOME));
    print(model);
    setState(ViewState.Idle);
  }

  void onError(dynamic response) {
    setState(ViewState.Idle);
    var model = response as ErrorFirebaseModel;
    UIHelper.showSnackBar(loginScaffoldKey, child: Text(model.error.message));
  }

  Future saveUserState(LoginResponse model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(UserLocalState.TOKEN_ID.toString(), model.idToken);
    prefs.setString(
        UserLocalState.TOKEN_REFRESH.toString(), model.refreshToken);
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
    _context = context;
  }
}
