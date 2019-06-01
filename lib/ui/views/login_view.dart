import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/login/login_request.dart';
import 'package:hwablog/core/viewmodels/login_model.dart';
import 'package:hwablog/ui/shared/text_styles.dart';
import 'package:hwablog/ui/shared/ui_helpers.dart';
import 'package:hwablog/ui/shared/validator_helpers.dart';

import '../../locator.dart';
import 'baseview.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  @override
  Widget build(BuildContext context) {
    LoginModel.init(context);
    return BaseView<LoginModel>(
      builder: (context, model, child) => Form(
            key: model.formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: model.userEmail,
                    validator: ValidatorHelper.emailValidator,
                    decoration: InputDecoration(
                      helperText: "Write mail adress.",
                      hintText: "hwa@gmail.com",
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: model.userPassword,
                    validator: ValidatorHelper.passwordValidator,
                    decoration: InputDecoration(
                        helperText: "Write mail password.",
                        hintText: "*****",
                        labelText: "Password"),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Icon(Icons.mail),
                          onPressed: () {},
                        ),
                      ),
                      UIHelper.horizontalSpaceSmall(),
                      Expanded(
                        child: RaisedButton(
                          color: Colors.blue,
                          child: model.state == ViewState.Idle
                              ? Text(
                                  "Login",
                                  style: loginButtonStyle,
                                )
                              : CircularProgressIndicator(),
                          onPressed: model.login,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
