import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/error/error_firebase.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/services/shared_prefernces_api.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';
import 'package:hwablog/ui/shared/ui_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel extends BaseModel {
  TextEditingController userEmail;
  TextEditingController userPassword;
  GlobalKey<ScaffoldState> loginViewKey;
  final formKey = GlobalKey<FormState>();
  BuildContext _context;

  LoginModel() {
    userEmail = new TextEditingController(text: "hwa@hwa.com");
    userPassword = new TextEditingController(text: "12345h");
    loginViewKey = GlobalKey<ScaffoldState>(debugLabel: "loginView");
  }

  void login() {
    if (formKey.currentState.validate()) {
      setState(ViewState.Busy);
      var _user = LoginRequest(
          email: userEmail.text.trim(),
          password: userPassword.text.trim(),
          returnSecureToken: true.toString());
      api
          .siginUser(_user)
          .then(onSuccess)
          .catchError(onError)
          .whenComplete(() {
        setState(ViewState.Idle);
      });
    } else
      return;
  }

  void onSuccess(dynamic response) {
    var model = response as LoginResponse;
    UIHelper.showSnackbar(loginViewKey, child: Text("Welcome ${model.email}"));
    saveUserState(model);
    Navigator.of(_context).pushNamedAndRemoveUntil(
        EnumConverter.stringFromEnum(RouteState.HOME),
        ModalRoute.withName('/'));
  }

  void onError(dynamic response) {
    var model = response as ErrorFirebaseModel;
    UIHelper.showSnackbar(loginViewKey,
        child: Text("Error ${model.error.message}"));
  }

  void saveUserState(LoginResponse model) {
    SharedManager().token = model.idToken;
    SharedManager().refreshToken = model.refreshToken;
  }

  @override
  void setContext(BuildContext context) {
    _context = context;
  }
}
