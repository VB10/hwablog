import 'dart:async';

import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/model/user.dart';
import 'package:hwablog/core/services/api.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';

import '../../locator.dart';

class LoginModel extends BaseModel {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(User user) async {
        setState(ViewState.Busy);

    var fetchUser = await _api.signinUser(user);
    var hasUser = fetchUser != null;
    if (hasUser)
      userController.add(fetchUser);
    else
      print("Error $fetchUser");

    setState(ViewState.Idle);
    return hasUser;
  }
}
