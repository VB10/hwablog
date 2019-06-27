import 'package:flutter/material.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/viewmodels/splash_model.dart';
import 'package:hwablog/ui/views/baseview.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashModel>(
      onModelReady: (model) {
        model.setContext(context);
        model.controlUserLocalData();
      },
      builder: (context, model, child) => Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage("assets/images/hwa_logo.jpg"),
                      ),
                    ),
                  ),
                  model.state == ViewState.Busy
                      ? CircularProgressIndicator()
                      : Text("Success")
                ],
              ),
            ),
          ),
    );
  }
}
