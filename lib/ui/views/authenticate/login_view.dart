import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/viewmodels/login_model.dart';
import 'package:hwablog/ui/shared/text_styles.dart';
import 'package:hwablog/ui/shared/ui_helpers.dart';
import 'package:hwablog/ui/shared/validator_helpers.dart';

import '../baseview.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(onModelReady: (model) {
      model.setContext(context);
    }, builder: (context, model, child) {
      return Scaffold(
        key: model.loginViewKey,
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Placeholder(
                  fallbackHeight: 150,
                  color: Colors.green,
                ),
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
                UIHelper.verticalSpaceMedium(),
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: 50,
                  width: model.state == ViewState.Idle
                      ? UIHelper.SPACE500
                      : UIHelper.SPACE500 / 3,
                  child: FlatButton(
                    color: Colors.blue,
                    child: model.state == ViewState.Idle
                        ? Text("Login", style: loginButtonStyle)
                        : CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                    onPressed: model.login,
                  ),
                ),
                RaisedButton(
                  child: Icon(Icons.mail),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
