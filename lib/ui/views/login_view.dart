import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/user.dart';
import 'package:hwablog/core/viewmodels/login_model.dart';
import 'package:hwablog/ui/shared/text_styles.dart';
import 'package:hwablog/ui/shared/ui_helpers.dart';

import 'baseview.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      helperText: "Write mail adress.",
                      hintText: "hwa@gmail.com",
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
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
                      model.state == ViewState.Busy
                          ? CircularProgressIndicator()
                          : Expanded(
                              child: RaisedButton(
                                color: Colors.blue,
                                child: Text(
                                  "Login",
                                  style: loginButtonStyle,
                                ),
                                onPressed: () async {
                                  var user = User(
                                      email: "veli@veli.com",
                                      password: "123456");
                                  var loginSuccess = await model.login(user);

                                  print(loginSuccess);
                                },
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
