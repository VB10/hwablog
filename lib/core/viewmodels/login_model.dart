import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
import 'package:hwablog/core/services/api.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';
import '../../locator.dart';

class LoginModel extends BaseModel {
  Api _api = locator<Api>();

  TextEditingController userEmail;
  TextEditingController userPassword;
  String email_error;
  String password_error;
  BuildContext context;

  LoginModel.init(BuildContext context) {
    locator<LoginModel>().context = context;
  }
  LoginModel() {
    userEmail = new TextEditingController();
    userPassword = new TextEditingController();
  }
  final formKey = GlobalKey<FormState>();

  Future<bool> login() async {
    Navigator.of(context)
        .pushNamed(EnumConverter.stringFromEnum(RouteState.REGISTER));
    // if (formKey.currentState.validate()) {
    //   // await model.login(user);
    //   // print(loginSuccess);
    // } else {
    //   Scaffold.of(context)
    //       .showSnackBar(SnackBar(content: Text(userEmail.text)));
    // }
  }
}
