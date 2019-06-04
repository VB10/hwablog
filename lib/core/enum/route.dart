enum RouteState { HOME, LOGIN, REGISTER, NONE, TAB, TEMP }
enum UserLocalState { TOKEN_ID, TOKEN_REFRESH }

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
        //initial page
        return RouteState.TAB;
      case "/":
        return RouteState.TEMP;
      default:
        return RouteState.NONE;
    }
  }
}
