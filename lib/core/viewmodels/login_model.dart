import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/error_firebase.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/model/login/login_response.dart';
import 'package:hwablog/core/services/api.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';
import '../../locator.dart';

class LoginModel extends BaseModel {
  Api _api = locator<Api>();

  TextEditingController userEmail;
  TextEditingController userPassword;

  BuildContext context;

  LoginModel.init(BuildContext context) {
    locator<LoginModel>().context = context;
  }
  LoginModel() {
    userEmail = new TextEditingController();
    userPassword = new TextEditingController();
  }
  final formKey = GlobalKey<FormState>();

  Future login() async {
    if (formKey.currentState.validate()) {
      var _user =
          LoginRequest(email: userEmail.text, password: userPassword.text);
      setState(ViewState.Busy);
      _api.signin(_user).then(onSuccess).catchError(onError);
    } else
      return;
  }

  void onSuccess(dynamic response) {
    var model = response as LoginResponse;
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(model.email)));
    Navigator.of(context)
        .pushNamed(EnumConverter.stringFromEnum(RouteState.REGISTER));
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
}
