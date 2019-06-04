import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/services/api.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../locator.dart';

class LoginModel extends BaseModel {
  Api _api = locator<Api>();

  TextEditingController userEmail;
  TextEditingController userPassword;

  BuildContext context;

  LoginModel() {
    userEmail = new TextEditingController();
    userPassword = new TextEditingController();
  }
  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState.validate()) {
      setState(ViewState.Busy);
      var _user = LoginRequest(
          email: userEmail.text.trim(),
          password: userPassword.text.trim(),
          returnSecureToken: true.toString());
      _api.signin_user(_user).then(onSuccess).catchError(onError);
    } else
      return;
  }

  Future onSuccess(dynamic response) async {
    var model = response as LoginResponse;
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Welcome ${model.email}")));
    saveUserState(model);

    Navigator.of(context)
        .pushNamed(EnumConverter.stringFromEnum(RouteState.HOME));
    print(model);
    setState(ViewState.Idle);
  }

  void onError(dynamic response) {
    var model = response as LoginResponse;
    Navigator.of(context)
        .pushNamed(EnumConverter.stringFromEnum(RouteState.REGISTER));
    setState(ViewState.Idle);
  }

  @override
  void dispose() {
    this.removeListener(() => this);
  }

  saveUserState(LoginResponse model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    
    prefs.setString(UserLocalState.TOKEN_ID.toString(), model.id_token);
    prefs.setString(
        UserLocalState.TOKEN_REFRESH.toString(), model.refreshToken);
  }
}
