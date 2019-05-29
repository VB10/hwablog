enum RouteState { HOME, LOGIN, REGISTER, NONE, TAB }

class EnumConverter {
  static String stringFromEnum(RouteState state) {
    switch (state) {
      case RouteState.HOME:
        return "/home";
      case RouteState.LOGIN:
        return "/login";
      case RouteState.REGISTER:
        return "/register";
      case RouteState.TAB:
        return "/tab";
      default:
        return "/none";
    }
  }

  static RouteState enumFromString(String data) {
    switch (data) {
      case "/home":
        return RouteState.HOME;
      case "/login":
        return RouteState.LOGIN;
      case "/register":
        return RouteState.REGISTER;
      case "/tab":
      case "/":
        //initial page
        return RouteState.TAB;
      default:
        return RouteState.NONE;
    }
  }
}
