import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/route.dart';
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

  Future login() async {
    if (formKey.currentState.validate()) {
      var _user =
          LoginRequest(email: userEmail.text, password: userPassword.text);

      _api.signin(_user).then((val) {
        // Sucess
        var model = val as LoginResponse;
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(model.email)));
        print(val);
      }).catchError((error) {
        // Error
        var errorModel = error as ErrorFirebaseModel;
        print(errorModel.error.code);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(errorModel.error.message)));
      });

      // var response = await _api.signinUser(_user);
      // if (response != null) {
      //   Navigator.of(context)
      //       .pushNamed(EnumConverter.stringFromEnum(RouteState.REGISTER));
      // } else {
      //   Scaffold.of(context)
      //       .showSnackBar(SnackBar(content: Text(userEmail.text)));
      // }
    } else
      return;
  }
}
